// giữ nguyên tên file / class: dynamic_form
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signature/signature.dart';

import 'package:dynamicform/features/province/application/province.api.dart';
import 'package:dynamicform/features/ward/application/ward.api.dart';

import 'package:dynamicform/features/form/application/form_request.api.dart';
import 'package:dynamicform/features/form/domain/form_request.entity.dart';
import 'domain/form_field.entity.dart';

class dynamic_form extends StatefulWidget {
  const dynamic_form({super.key});

  @override
  State<dynamic_form> createState() => _dynamic_formState();
}

class _dynamic_formState extends State<dynamic_form> {
  // ====== FORM STATE (type-safe) ======
  FormRequest? _formRequest;

  // ====== STATE MAPS ======
  final Map<String, TextEditingController> _textCtrls = {};
  final Map<String, DateTime?> _dateValues = {};
  final Map<String, String?> _singleValues = {};
  final Map<String, bool> _checkboxValues = {};
  final Map<String, Set<String>> _multiValues = {};
  final Map<String, List<File>> _imageArrays = {};

  // Signature
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  // ====== PROVINCE / WARD (typed options) ======
  List<FormFieldOption> _provinces = [];
  List<FormFieldOption> _wards = [];

  // ====== HELPERS GETTERS ======
  List<FormFieldEntity> get _spec => _formRequest?.data ?? const [];

  // Thêm vào trong _dynamic_formState
  double _measureTextHeight(String text, double maxWidth, TextStyle style) {
    final tp = TextPainter(
      text: TextSpan(text: text, style: style),
      // textDirection: TextDirection.LTR,
      maxLines: null,
    );
    tp.layout(maxWidth: maxWidth);
    return tp.size.height;
  }


  // ====== LOAD FORM (type-safe) ======
  Future<void> loadFormRequest(String formId) async {
    try {
      final res = await getFormRequest(id: formId);
      if (res.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(res.body);
        if (body['status'] == 'success' && body['data'] != null) {
          final Map<String, dynamic> data = Map<String, dynamic>.from(body['data']);

          // data["data"] có thể là String (JSON) hoặc List
          final dynamic rawData = data['data'];
          List<FormFieldEntity> fields = [];

          if (rawData is String) {
            final decoded = jsonDecode(rawData) as List;
            fields = decoded
                .map((e) => FormFieldEntity.fromJson(Map<String, dynamic>.from(e)))
                .toList();
          } else if (rawData is List) {
            fields = rawData
                .map((e) => FormFieldEntity.fromJson(Map<String, dynamic>.from(e)))
                .toList();
          }

          final formRequest = FormRequest(
            id: data['id']?.toString() ?? '',
            title: data['title']?.toString() ?? '',
            data: fields,
            createdAt: data['created_at']?.toString(),
            updatedAt: data['updated_at']?.toString(),
          );

          setState(() {
            _formRequest = formRequest;
          });

          _initControllersFromSpec(); // init theo spec đã load
          debugPrint("Form loaded: ${formRequest.id} • ${formRequest.title} • ${_spec.length} fields");
          return;
        }
      }

      // Fallback khi API fail
      setState(() {
        _formRequest = FormRequest(
          id: 'fallback',
          title: 'Form Fallback',
          data: const [
            FormFieldEntity(type: 'titleLarge', label: 'FORM (FALLBACK)'),
            FormFieldEntity(type: 'text', label: 'Họ và tên', name: 'fullName', isRequired: true, colMd: 6),
            FormFieldEntity(type: 'date', label: 'Ngày sinh', name: 'birthDate', colMd: 6),
            FormFieldEntity(type: 'gender', label: 'Giới tính', name: 'gender', colMd: 6),
            FormFieldEntity(type: 'textarea', label: 'Ghi chú', name: 'note', row: 3, colMd: 12),
          ],
        );
      });
      _initControllersFromSpec();
    } catch (e) {
      debugPrint('Exception load form request: $e');
      setState(() {
        _formRequest = const FormRequest(
          id: 'fallback-ex',
          title: 'Form Fallback (Exception)',
          data: [
            FormFieldEntity(type: 'text', label: 'Họ và tên', name: 'fullName'),
          ],
        );
      });
      _initControllersFromSpec();
    }
  }

  // ====== PROVINCE / WARD ======
  Future<void> loadProvinces() async {
    try {
      final response = await geProvinces();
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final items = data['data']['items'] as List<dynamic>;
        if (items.isNotEmpty) {
          final firstProvinceId = items.first['id'].toString();
          setState(() {
            _provinces = items
                .map<FormFieldOption>((e) =>
                FormFieldOption(value: e['id'].toString(), label: e['name'].toString()))
                .toList();
            _singleValues['province'] = firstProvinceId; // default
          });
          await loadWards(firstProvinceId);
        }
      } else {
        debugPrint('Lấy provinces thất bại: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Lỗi khi load provinces: $e');
    }
  }

  Future<void> loadWards(String provinceCode) async {
    try {
      final res = await getWards(provinceCode: provinceCode);
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        if (data['status'] == 'success' &&
            data['data'] is Map &&
            data['data']['items'] is List) {
          final wardsList = data['data']['items'] as List;
          if (wardsList.isNotEmpty) {
            setState(() {
              _wards = wardsList
                  .map<FormFieldOption>((e) =>
                  FormFieldOption(value: e['code'].toString(), label: e['name'].toString()))
                  .toList();
              _singleValues['ward'] = _wards.first.value;
            });
          } else {
            debugPrint('Không có dữ liệu wards cho provinceCode: $provinceCode');
          }
        } else {
          debugPrint('Dữ liệu wards không hợp lệ: $data');
        }
      } else {
        debugPrint('Lỗi load wards: ${res.statusCode}');
      }
    } catch (e) {
      debugPrint('Exception load wards: $e');
    }
  }

  // ====== INIT CONTROLLERS/STATE (typed) ======
  void _initControllersFromSpec() {
    // clear cũ
    for (final c in _textCtrls.values) {
      c.dispose();
    }
    _textCtrls.clear();
    _dateValues.clear();
    _singleValues.clear();
    _checkboxValues.clear();
    _multiValues.clear();
    _imageArrays.clear();

    for (final f in _spec) {
      final type = f.type;
      final name = f.name;

      // bỏ qua title/description không có name
      final isDisplayOnly = type == 'titleLarge' ||
          type == 'titleMedium' ||
          type == 'titleSmall' ||
          type == 'description';

      if (isDisplayOnly) continue;
      if (name == null || name.isEmpty) continue;

      switch (type) {
        case 'text':
        case 'textarea':
          _textCtrls[name] = TextEditingController();
          break;
        case 'date':
          _dateValues[name] = null;
          break;
        case 'select':
          if (f.options != null && f.options!.isNotEmpty) {
            _singleValues[name] = f.options!.first.value; // lấy value của OptionEntity
          } else {
            _singleValues[name] = null;
          }
          if ((f.nameSaveExtraOption ?? '').isNotEmpty) {
            _textCtrls['${name}__extra'] = TextEditingController();
          }
          break;
        case 'radio':
        case 'province':
        case 'ward':
        case 'gender':
          if (f.options != null && f.options!.isNotEmpty) {
            //_singleValues[name] = f.options!.first['value'];
          } else {
            _singleValues[name] = null;
          }
          if ((f.nameSaveExtraOption ?? '').isNotEmpty) {
            _textCtrls['${name}__extra'] = TextEditingController();
          }
          break;
        case 'checkbox':
          _checkboxValues[name] = false;
          break;
        case 'multiCheckbox':
          _multiValues[name] = <String>{};
          for (final opt in f.options ?? const []) {
            if (opt.isExtraOption == true) {
              _textCtrls['${name}__extra__${opt.value}'] = TextEditingController();
            }
          }
          break;
        case 'image':
          _imageArrays[name] = <File>[];
          break;
        case 'signature':
        // đã có _signatureController
          break;
        default:
          break;
      }
    }
    setState(() {});
  }

  // // ====== STYLE input ======
  // InputDecoration _inputDecoration(String? label, {Widget? suffixIcon}) {
  //   return InputDecoration(
  //     isDense: true,
  //     contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
  //     border: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(6),
  //       borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
  //     ),
  //     enabledBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(6),
  //       borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
  //     ),
  //     focusedBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(6),
  //       borderSide: const BorderSide(color: Colors.blue, width: 1.2),
  //     ),
  //     labelText: label,
  //     suffixIcon: suffixIcon != null
  //         ? Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: SizedBox(height: 20, width: 20, child: suffixIcon),
  //     )
  //         : null,
  //   );
  // }

  // InputDecoration _inputDecoration(String? label, {Widget? suffixIcon}) {
  //   return InputDecoration(
  //     isDense: true,
  //     contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
  //     border: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(6),
  //       borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
  //     ),
  //     enabledBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(6),
  //       borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
  //     ),
  //     focusedBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(6),
  //       borderSide: const BorderSide(color: Colors.blue, width: 1.2),
  //     ),
  //     labelText: label,
  //     suffixIcon: suffixIcon != null
  //         ? Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: SizedBox(height: 20, width: 20, child: suffixIcon),
  //     )
  //         : null,
  //   );
  // }

  InputDecoration _inputDecoration(String? label, {Widget? suffixIcon}) {
    return InputDecoration(
      isDense: true, // giúp input gọn hơn
      alignLabelWithHint: true, // label luôn thẳng hàng trên cùng
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Colors.blue, width: 1.2),
      ),
      // labelText: label,
      labelStyle: const TextStyle(
        height: 1.2, // đảm bảo label cùng chiều cao trong 1 dòng
      ),
      suffixIcon: suffixIcon != null
          ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(height: 20, width: 20, child: suffixIcon),
      )
          : null,
    );
  }

  // ====== IMAGE PICKER ======
  Future<File?> _pickImageFrom(ImageSource source) async {
    final picked = await ImagePicker().pickImage(source: source, imageQuality: 75);
    if (picked == null) return null;
    return File(picked.path);
  }

  // ====== HELPERS (typed) ======
  String _labelWithRequired(FormFieldEntity f) {
    final label = (f.label ?? '').toString();
    final isRequired = f.isRequired == true;
    return isRequired ? '$label(*)' : label;
  }

  bool _isCurrentSelectionExtra(FormFieldEntity field) {
    final type = field.type;
    if (type != 'select' && type != 'radio') return false;
    final name = field.name;
    if (name == null) return false;
    final selected = _singleValues[name];
    if (selected == null) return false;
    final options = field.options ?? const [];
    final opt = options.firstWhere(
          (o) => o.value == selected,
      orElse: () => const FormFieldOption(),
    );
    return opt.isExtraOption == true;
  }

  String? _labelForOption(List<FormFieldOption> options, String? value) {
    if (value == null) return null;
    final found = options.firstWhere(
          (o) => o.value == value,
      orElse: () => const FormFieldOption(),
    );
    return found.label;
  }

  // ====== UI BUILDERS (typed) ======
  Widget _wrapWithLabel(String label, Widget child, {double? labelMinHeight}) {
    final labelWidget = Text(
      label,
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelMinHeight != null)
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: labelMinHeight),
            child: Align(alignment: Alignment.centerLeft, child: labelWidget),
          )
        else
          labelWidget,
        const SizedBox(height: 6),
        child,
      ],
    );
  }

  Widget _titleLarge(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 8),
      child: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _titleMedium(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 6),
      child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
    );
  }

  Widget _titleSmall(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
    );
  }

  Widget _description(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text, style: TextStyle(color: Colors.grey.shade700)),
    );
  }

  // Widget _buildText(FormFieldEntity f) {
  //   final name = f.name!;
  //   return _wrapWithLabel(
  //     _labelWithRequired(f),
  //     TextField(
  //       controller: _textCtrls[name],
  //       decoration: _inputDecoration(f.label),
  //       style: const TextStyle(fontSize: 14),
  //     ),
  //   );
  // }

  Widget _buildText(FormFieldEntity f, {double? labelMinHeight}) {
    final name = f.name!;
    return _wrapWithLabel(
      _labelWithRequired(f),
      SizedBox(
        height: 48,
        child: TextField(
          controller: _textCtrls[name],
          decoration: _inputDecoration(null), // không label trong outline
          style: const TextStyle(fontSize: 14),
        ),
      ),
      labelMinHeight: labelMinHeight,
    );
  }

  Widget _buildTextarea(FormFieldEntity f, {double? labelMinHeight}) {
    final name = f.name!;
    final rows = (f.row != null && f.row! > 0) ? f.row! : 3;
    return _wrapWithLabel(
      _labelWithRequired(f),
      TextField(
        controller: _textCtrls[name],
        minLines: rows,
        maxLines: rows + 2,
        decoration: _inputDecoration(null),
        style: const TextStyle(fontSize: 14),
      ),
      labelMinHeight: labelMinHeight,
    );
  }

  Widget _buildDate(FormFieldEntity f, {double? labelMinHeight}) {
    final name = f.name!;
    return _wrapWithLabel(
      _labelWithRequired(f),
      SizedBox(
        height: 48,
        child: InkWell(
          onTap: () async {
            DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );
            if (picked != null) setState(() => _dateValues[name] = picked);
          },
          child: IgnorePointer(
            child: TextField(
              controller: TextEditingController(
                text: _dateValues[name] != null
                    ? DateFormat('dd/MM/yyyy').format(_dateValues[name]!)
                    : '',
              ),
              decoration: _inputDecoration(
                null,
                suffixIcon: Icon(Icons.calendar_today, size: 18, color: Colors.grey.shade600),
              ).copyWith(
                hintText: 'Chọn thời điểm',
                hintStyle: TextStyle(color: Colors.grey.shade400),
              ),
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
      labelMinHeight: labelMinHeight,
    );
  }

  Widget _buildDropdownLike({
    required FormFieldEntity f,
    required List<FormFieldOption> options,
    required String name,
    void Function(String?)? onChanged,
    double? labelMinHeight,
  }) {
    return _wrapWithLabel(
      _labelWithRequired(f),
      SizedBox(
        height: 48,
        child: DropdownButtonFormField<String>(
          value: _singleValues[name],
          decoration: _inputDecoration(null), // đồng bộ border với text
          items: options
              .map((opt) => DropdownMenuItem<String>(
            value: opt.value,
            child: Text(opt.label ?? '', style: const TextStyle(fontSize: 14)),
          ))
              .toList(),
          onChanged: (v) {
            setState(() => _singleValues[name] = v);
            onChanged?.call(v);
          },
        ),
      ),
      labelMinHeight: labelMinHeight,
    );
  }

  Widget _buildSelect(FormFieldEntity f, {double? labelMinHeight}) {
    final name = f.name!;
    final List<FormFieldOption> options = f.options ?? const [];
    final nameSaveExtra = f.nameSaveExtraOption;

    final select = _buildDropdownLike(
      f: f,
      options: options,
      name: name,
      labelMinHeight: labelMinHeight,
    );

    if ((nameSaveExtra ?? '').isNotEmpty && _isCurrentSelectionExtra(f)) {
      final extraKey = '${name}__extra';
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          select,
          const SizedBox(height: 8),
          TextField(
            controller: _textCtrls[extraKey],
            decoration: _inputDecoration('Nhập giá trị tùy chỉnh'),
            style: const TextStyle(fontSize: 14),
          ),
        ],
      );
    }
    return select;
  }

  Widget _buildRadio(FormFieldEntity f) {
    final name = f.name!;
    final nameSaveExtra = f.nameSaveExtraOption;
    final List<FormFieldOption> options = f.options ?? const [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_labelWithRequired(f), style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        ...options.map((opt) {
          final v = opt.value;
          final isSelected = _singleValues[name] == v;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadioListTile<String>(
                dense: true,
                visualDensity: VisualDensity.compact,
                contentPadding: EdgeInsets.zero,
                title: Text(opt.label ?? ''),
                value: v ?? "",
                groupValue: _singleValues[name],
                onChanged: (val) => setState(() => _singleValues[name] = val),
              ),
              if ((nameSaveExtra ?? '').isNotEmpty &&
                  (opt.isExtraOption == true) &&
                  isSelected)
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, bottom: 8),
                  child: SizedBox(
                    width: 360,
                    child: TextField(
                      controller: _textCtrls['${name}__extra'],
                      decoration: _inputDecoration('Nhập giá trị tùy chỉnh'),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildCheckbox(FormFieldEntity f) {
    final name = f.name!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Checkbox(
            value: _checkboxValues[name] ?? false,
            onChanged: (v) => setState(() => _checkboxValues[name] = v ?? false),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
          const SizedBox(width: 6),
          Expanded(child: Text(_labelWithRequired(f), style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  Widget _buildMultiCheckbox(FormFieldEntity f) {
    final name = f.name!;
    final List<FormFieldOption> options = f.options ?? const [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_labelWithRequired(f), style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        ...options.map((opt) {
          final v = opt.value!;
          final selected = _multiValues[name]!.contains(v);
          final isExtra = opt.isExtraOption == true;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CheckboxListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                contentPadding: EdgeInsets.zero,
                title: Text(opt.label ?? ''),
                value: selected,
                onChanged: (checked) {
                  setState(() {
                    if (checked == true) {
                      _multiValues[name]!.add(v);
                    } else {
                      _multiValues[name]!.remove(v);
                    }
                  });
                },
              ),
              if (isExtra && selected)
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, bottom: 8),
                  child: SizedBox(
                    width: 360,
                    child: TextField(
                      controller: _textCtrls['${name}__extra__${v}'],
                      decoration: _inputDecoration('Nhập giá trị tùy chỉnh'),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildProvince(FormFieldEntity f, {double? labelMinHeight}) {
    final name = f.name!;
    return _buildDropdownLike(
      f: f,
      name: name,
      options: _provinces,
      onChanged: (selectedProvinceCode) {
        if (selectedProvinceCode != null && selectedProvinceCode.isNotEmpty) {
          loadWards(selectedProvinceCode);
        }
      },
      labelMinHeight: labelMinHeight,
    );
  }

  Widget _buildWard(FormFieldEntity f, {double? labelMinHeight}) {
    final name = f.name!;
    return _buildDropdownLike(
      f: f,
      name: name,
      options: _wards,
      labelMinHeight: labelMinHeight,
    );
  }


  Widget _buildImageArray(FormFieldEntity f) {
    final String name = f.name!;
    final int max = (f.max != null && f.max! > 0) ? f.max! : 5;
    const double size = 120;

    Future<void> _chooseSourceAndPick() async {
      final source = await showModalBottomSheet<ImageSource>(
        context: context,
        builder: (context) => SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Chụp ảnh'),
                onTap: () => Navigator.pop(context, ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Chọn từ thư viện'),
                onTap: () => Navigator.pop(context, ImageSource.gallery),
              ),
            ],
          ),
        ),
      );
      if (source != null) {
        final file = await _pickImageFrom(source);
        if (file != null) setState(() => _imageArrays[name]!.add(file));
      }
    }

    Widget addTile() {
      return GestureDetector(
        onTap: () async {
          if (_imageArrays[name]!.length >= max) return;
          await _chooseSourceAndPick();
        },
        child: Container(
          width: 100, height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.add_a_photo, color: Colors.grey),
        ),
      );
    }

    Widget thumbTile(File file, int idx) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: size, height: size,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(6),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.file(file, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: -6, right: -6,
            child: Material(
              elevation: 2,
              shape: const CircleBorder(),
              color: Colors.white,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () => setState(() => _imageArrays[name]!.removeAt(idx)),
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Icon(Icons.delete_outline, size: 20, color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_labelWithRequired(f), style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ..._imageArrays[name]!.asMap().entries.map((e) => thumbTile(e.value, e.key)),
            if (_imageArrays[name]!.length < max) addTile(),
          ],
        ),
        const SizedBox(height: 8),
        Text("Tối đa $max ảnh • Nhấn để thêm ảnh", style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
      ],
    );
  }

  Widget _buildSignature(FormFieldEntity f) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_labelWithRequired(f), style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(6),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: SizedBox(
              height: 150,
              child: Stack(
                children: [
                  Signature(controller: _signatureController, backgroundColor: Colors.white),
                  Positioned(
                    right: 8, top: 8,
                    child: IconButton(
                      icon: const Icon(Icons.clear, size: 20),
                      tooltip: "Xóa chữ ký",
                      onPressed: () => _signatureController.clear(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ====== BUILD FIELD (typed) ======
  // REPLACE _buildField
  Widget _buildField(FormFieldEntity f, {double? labelMinHeight}) {
    final type = (f.type ?? '').toString();

    switch (type) {
      case 'text':
        return _buildText(f, labelMinHeight: labelMinHeight);
      case 'textarea':
        return _buildTextarea(f, labelMinHeight: labelMinHeight);
      case 'date':
        return _buildDate(f, labelMinHeight: labelMinHeight);
      case 'select':
        return _buildSelect(f, labelMinHeight: labelMinHeight);
      case 'province':
        return _buildProvince(f, labelMinHeight: labelMinHeight);
      case 'ward':
        return _buildWard(f, labelMinHeight: labelMinHeight);
      case 'radio':
        return _buildRadio(f); // (nếu muốn đồng bộ, mình chỉnh tiếp)
      case 'checkbox':
        return _buildCheckbox(f);
      case 'multiCheckbox':
        return _buildMultiCheckbox(f);
      case 'image':
        return _buildImageArray(f);
      case 'signature':
        return _buildSignature(f);
      case 'titleLarge':
        return _titleLarge(f.label ?? '');
      case 'titleMedium':
        return _titleMedium(f.label ?? '');
      case 'titleSmall':
        return _titleSmall(f.label ?? '');
      case 'description':
        return _description(f.label ?? '');
      case 'gender':
        return _buildDropdownLike(
          f: f.copyWith(label: f.label ?? 'Giới tính'),
          name: f.name!,
          options: const [
            FormFieldOption(value: 'Nam', label: 'Nam'),
            FormFieldOption(value: 'Nữ', label: 'Nữ'),
            FormFieldOption(value: 'Khác', label: 'Khác'),
          ],
          labelMinHeight: labelMinHeight,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  // ====== LAYOUT ======
  List<Widget> _buildFormFromSpec() {
    final spec = _spec;
    if (spec.isEmpty) {
      return const [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: CircularProgressIndicator(),
          ),
        )
      ];
    }

    final widgets = <Widget>[];
    int i = 0;

    while (i < spec.length) {
      final f = spec[i];
      final type = f.type;

      final isDisplayOnly = type == 'titleLarge' ||
          type == 'titleMedium' ||
          type == 'titleSmall' ||
          type == 'description';

      final colMd = f.colMd ?? 12;

      if (isDisplayOnly ||
          colMd == 12 ||
          i == spec.length - 1 ||
          (spec[i + 1].colMd ?? 12) != 6 ||
          colMd != 6) {
        widgets.add(_buildField(f));
        widgets.add(const SizedBox(height: 12));
        i++;
        continue;
      }

      final g = spec[i + 1];
      if (colMd == 6 && (g.colMd ?? 12) == 6) {
        widgets.add(Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_buildField(f)])),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_buildField(g)])),
          ],
        ));
        widgets.add(const SizedBox(height: 12));
        i += 2;
      } else {
        widgets.add(_buildField(f));
        widgets.add(const SizedBox(height: 12));
        i++;
      }
    }

    return widgets;
  }

  // ====== SUBMIT ======
  void _submitForm() async {
    final Map<String, dynamic> result = {};

    for (final f in _spec) {
      final type = f.type;
      final name = f.name;
      final isArray = f.valueIsArray == true;
      final saveLabelKey = f.nameSaveLabel;
      final saveExtraKey = f.nameSaveExtraOption;

      // Các field hiển thị không có name → bỏ qua khi submit
      if (type == 'titleLarge' ||
          type == 'titleMedium' ||
          type == 'titleSmall' ||
          type == 'description' ||
          name == null ||
          name.isEmpty) {
        continue;
      }

      switch (type) {
        case 'text':
        case 'textarea':
          result[name] = _textCtrls[name]?.text ?? '';
          break;

        case 'date':
          final dt = _dateValues[name];
          result[name] = (dt != null) ? DateFormat('dd/MM/yyyy').format(dt) : null;
          break;

        case 'select':
        case 'radio': {
          final selected = _singleValues[name];
          result[name] = selected;

          final options = f.options ?? const [];
          if ((saveLabelKey ?? '').isNotEmpty) {
            result[saveLabelKey!] = _labelForOption(options, selected);
          }

          if ((saveExtraKey ?? '').isNotEmpty) {
            if (_isCurrentSelectionExtra(f)) {
              result[saveExtraKey!] = _textCtrls['${name}__extra']?.text ?? '';
            } else {
              result[saveExtraKey!] = null;
            }
          }
          break;
        }

        case 'checkbox': {
          final val = _checkboxValues[name] ?? false;
          result[name] = val;
          if ((saveLabelKey ?? '').isNotEmpty) {
            result[saveLabelKey!] = val ? (f.label ?? '') : null;
          }
          break;
        }

        case 'multiCheckbox': {
          final selected = _multiValues[name]!.toList();
          result[name] = isArray ? selected : (selected.isEmpty ? null : selected.first);

          final options = f.options ?? const [];
          if ((saveLabelKey ?? '').isNotEmpty) {
            final labels = <String>[];
            for (final v in selected) {
              final lb = _labelForOption(options, v);
              if (lb != null) labels.add(lb);
            }
            result[saveLabelKey!] = labels;
          }
          if ((saveExtraKey ?? '').isNotEmpty) {
            final extras = <Map<String, String>>[];
            for (final opt in options) {
              if (opt.isExtraOption == true && _multiValues[name]!.contains(opt.value)) {
                final key = '${name}__extra__${opt.value}';
                final txt = _textCtrls[key]?.text ?? '';
                extras.add({"value": opt.value ?? '', "text": txt});
              }
            }
            result[saveExtraKey!] = extras;
          }
          break;
        }

        case 'province':
        case 'ward':
        case 'gender': {
          final selected = _singleValues[name];
          result[name] = selected;
          if ((saveLabelKey ?? '').isNotEmpty) {
            List<FormFieldOption> options = const [];
            if (type == 'province') {
              options = _provinces;
            } else if (type == 'ward') {
              options = _wards;
            } else if (type == 'gender') {
              options = const [
                FormFieldOption(value: 'Nam', label: 'Nam'),
                FormFieldOption(value: 'Nữ', label: 'Nữ'),
                FormFieldOption(value: 'Khác', label: 'Khác'),
              ];
            }
            result[saveLabelKey!] = _labelForOption(options, selected);
          }
          break;
        }

        case 'image': {
          final paths = _imageArrays[name]!.map((f) => f.path).toList();
          result[name] = isArray ? paths : (paths.isEmpty ? null : paths.first);
          break;
        }

        case 'signature':
        // Có thể export bytes nếu cần:
        // final bytes = await _signatureController.toPngBytes();
        // result['${name}_bytesLength'] = bytes?.length;
          result[name] = _signatureController.isNotEmpty;
          break;

        default:
          break;
      }
    }

    debugPrint(jsonEncode(result));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã lưu tạm form (xem debugPrint)')),
    );
  }

  // ====== FOOTER (giản lược, bạn có thể thay bằng footer cũ) ======
  Widget _buildFooter() {
    return Column(
      children: [
        const SizedBox(height: 16),
        Divider(color: Colors.grey.shade300),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/6/6b/VNPT_logo.png",
              width: 30, height: 30,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, size: 30),
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: Text(
                "© 2025 VNPT - Bản quyền thuộc về Tập đoàn Bưu chính Viễn thông Việt Nam",
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ====== BUILD ======
  @override
  void initState() {
    super.initState();
    loadFormRequest("345cd9d1-0b4a-4089-8c5e-1ef882d18019");
    loadProvinces();
  }

  @override
  void dispose() {
    for (final c in _textCtrls.values) {
      c.dispose();
    }
    _signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widgets = _buildFormFromSpec();
    return Scaffold(
      appBar: AppBar(title: Text(_formRequest?.title ?? "Phiếu yêu cầu")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [...widgets, _buildFooter()]),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _spec.isEmpty ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Xác nhận hoàn thành",
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {}, // TODO: preview
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    side: const BorderSide(color: Colors.blue),
                  ),
                  child: const Text("Xem trước",
                      style: TextStyle(fontSize: 14, color: Colors.blue)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
