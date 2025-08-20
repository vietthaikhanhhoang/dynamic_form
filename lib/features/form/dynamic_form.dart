// giữ nguyên tên file / class: dynamic_form
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dynamicform/features/form/widgets/formgeneral.dart';
import 'package:dynamicform/features/ward/domain/ward.entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signature/signature.dart';

import 'package:dynamicform/features/province/application/province.api.dart';
import 'package:dynamicform/features/ward/application/ward.api.dart';

import 'package:dynamicform/features/form/application/form_request.api.dart';
import 'package:dynamicform/features/form/domain/form_request.entity.dart';
import '../camera/camera_form.dart';
import 'domain/form_field.entity.dart';

class dynamic_form extends StatefulWidget {
  const dynamic_form({super.key});

  @override
  State<dynamic_form> createState() => _dynamic_formState();
}

class _dynamic_formState extends State<dynamic_form> {
  // ====== FORM STATE (type-safe) ======
  FormRequest? _formRequest;

  List<FormFieldEntity> _selectedProvinces = [];
  List<FormFieldEntity> _selectedWards = [];

  // ====== STATE MAPS ======
  final Map<String, TextEditingController> _textCtrls = {};
  final Map<String, TextEditingController> _dateCtrls = {};

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
            loadProvinces();
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
          setState(() {
            _provinces = items
                .map<FormFieldOption>((e) => FormFieldOption(
              value: e['id'].toString(),
              label: e['name'].toString(),
            ))
                .toList();
          });

          final provinceFields = _spec.where((f) => f.type == 'province');

          //Lấy giá trị của chúng (nếu có) và lưu vào mảng
          // List _selectedProvinces = provinceFields
          //     .where((f) => f.value != null && f.value!.isNotEmpty)
          //     .map((f) => f.value!)
          //     .toList();
          _selectedProvinces = provinceFields
              .where((f) => "2" != null && "2"!.isNotEmpty)
              .toList();


          for (final provinceField in _selectedProvinces) {
            final provinceCode = "2"; // hoặc provinceField.value nếu không fake
            final nameFieldDependent = provinceField.name!;

            await loadWards(provinceCode, nameFieldDependent);
          }
        }
      } else {
        debugPrint('Lấy provinces thất bại: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Lỗi khi load provinces: $e');
    }
  }


  Future<void> loadWards(String provinceCode, String nameFieldDependent) async {
    try {
      final res = await getWards(provinceCode: provinceCode);
      if (res.statusCode != 200) {
        debugPrint('Lỗi load wards: ${res.statusCode}');
        return;
      }

      final data = jsonDecode(res.body);
      if (data['status'] != 'success' ||
          data['data'] is! Map ||
          data['data']['items'] is! List) {
        debugPrint('Dữ liệu wards không hợp lệ: $data');
        return;
      }

      final wardsList = data['data']['items'] as List;
      if (wardsList.isEmpty) {
        debugPrint('Không có dữ liệu wards cho provinceCode: $provinceCode');
        return;
      }

      _selectedWards = _spec
          // .where((f) => f.type == 'ward' && f.value != null)
          .where((f) => f.type == 'ward')
          .toList();
      print("ok");
      print("oh yeal");

      //Lấy giá trị của chúng (nếu có) và lưu vào mảng
      // List _selectedProvinces = provinceFields
      //     .where((f) => f.value != null && f.value!.isNotEmpty)
      //     .map((f) => f.value!)
      //     .toList();
      // _selectedProvinces = provinceFields
      //     .where((f) => "2" != null && "2"!.isNotEmpty)
      //     .toList();

      // Chuyển wardsList thành List<FormFieldOption>
      final wardOptions = wardsList.map<FormFieldOption>((e) => FormFieldOption(
        value: e['code'].toString(),
        label: e['name']
      )).toList();

      // Gán _wards
      _wards = wardOptions;

      // Cập nhật _formRequest.data với copyWith
      setState(() {
      });

      debugPrint("Wards loaded for $nameFieldDependent");

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
          _textCtrls[name] ??= TextEditingController(text: f.value?.toString());
          break;
        case 'date':
          _dateValues[name] = null;
          break;
        case 'select':
          if (f.options != null && f.options!.isNotEmpty) {
            _singleValues[name] = f.options!.first.value.toString(); // lấy value của OptionEntity
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
        // if (f.options != null && f.options!.isNotEmpty) {
        //   _singleValues[name] = f.options!.first.value;
        // } else {
        //   _singleValues[name] = null;
        // }
        // if ((f.nameSaveExtraOption ?? '').isNotEmpty) {
        //   _textCtrls['${name}__extra'] = TextEditingController();
        // }
        // break;
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
          break;
        default:
          break;
      }
    }
    setState(() {});
  }

  // ====== IMAGE PICKER ======
  Future<File?> _pickImageFrom(ImageSource source) async {
    final picked = await ImagePicker().pickImage(source: source, imageQuality: 75);
    if (picked == null) return null;
    return File(picked.path);
  }

  bool _isCurrentSelectionExtra(FormFieldEntity field) {
    final type = field.type;
    if (type != 'select' && type != 'radio') return false;

    final name = field.name;
    if (name == null) return false;

    // Ưu tiên lấy value từ field, nếu null thì lấy từ state
    final selected = field.value ?? _singleValues[name];
    if (selected == null) return false;

    final options = field.options ?? const [];
    final opt = options.firstWhere(
          (o) => o.value?.toString() == selected.toString(),
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

  Widget _buildText(FormFieldEntity f, {double? labelMinHeight}) {
    final name = f.name!;

    // Khởi tạo controller nếu chưa có
    _textCtrls[name] = _textCtrls[name] ?? TextEditingController();

    // Luôn set giá trị mặc định nếu f.value khác null
    _textCtrls[name]!.text = f.value?.toString() ?? '';

    return wrapWithLabel(
      labelWithRequired(f),
      SizedBox(
        height: 48,
        child: TextField(
          controller: _textCtrls[name],
          decoration: inputDecoration(null),
          style: const TextStyle(fontSize: 14),
          onChanged: (val) {
            // Cập nhật giá trị vào entity gốc hoặc map ngoài
            // _formData[name] = f.copyWith(value: val);
          },
        ),
      ),
      labelMinHeight: labelMinHeight,
    );
  }

  Widget _buildDate(FormFieldEntity f, {double? labelMinHeight}) {
    final name = f.name!;

    // 1. Khởi tạo controller nếu chưa có
    _dateCtrls[name] = _dateCtrls[name] ?? TextEditingController();

    // 2. Lấy giá trị default từ server
    if (_dateValues[name] == null && f.value != null && f.value!.isNotEmpty) {
      _dateValues[name] = DateTime.tryParse(f.value!);
      if (_dateValues[name] != null) {
        _dateCtrls[name]!.text = DateFormat('dd/MM/yyyy').format(_dateValues[name]!);
      }
    }

    return wrapWithLabel(
      labelWithRequired(f),
      SizedBox(
        height: 48,
        child: InkWell(
          onTap: () async {
            DateTime? picked = await showDatePicker(
              context: context,
              initialDate: _dateValues[name] ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );
            if (picked != null) {
              setState(() {
                _dateValues[name] = picked;
                _dateCtrls[name]!.text = DateFormat('dd/MM/yyyy').format(picked);
              });
            }
          },
          child: IgnorePointer(
            child: TextField(
              controller: _dateCtrls[name],
              decoration: inputDecoration(
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

  Widget _buildSelect(FormFieldEntity f, {double? labelMinHeight}) {
    final name = f.name!;
    final List<FormFieldOption> options = f.options ?? const [];
    final nameSaveExtra = f.nameSaveExtraOption;

    final select = _buildDropdownLike(
      f: f,
      options: options,
      name: name,
      labelMinHeight: labelMinHeight,
      initialValue: f.value as String?, // ép đúng kiểu String?
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
            decoration: inputDecoration('Nhập giá trị tùy chỉnh'),
            style: const TextStyle(fontSize: 14),
          ),
        ],
      );
    }
    return select;
  }

  Widget _buildDropdownLike({
    required FormFieldEntity f,
    required List<FormFieldOption> options,
    required String name,
    void Function(String?)? onChanged,
    double? labelMinHeight,
    String? initialValue,
  }) {
    // luôn ép về String để so sánh an toàn
    final currentValue = (initialValue ?? _singleValues[name])?.toString();

    final validValues = options.map((e) => e.value?.toString()).toSet();
    final safeValue = validValues.contains(currentValue) ? currentValue : null;

    return wrapWithLabel(
      labelWithRequired(f),
      SizedBox(
        height: 48,
        child: DropdownButtonFormField<String>(
          value: safeValue, // giờ sẽ là "3"
          decoration: inputDecoration(null),
          items: options
              .map((opt) => DropdownMenuItem<String>(
            value: opt.value?.toString(),
            child: Text(
              opt.label ?? '',
              style: const TextStyle(fontSize: 14),
            ),
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

  Widget _buildProvince(FormFieldEntity f, {double? labelMinHeight}) {
    final name = f.name!;
    return _buildDropdownLike(
      f: f,
      name: name,
      options: _provinces,
      onChanged: (selectedProvinceCode) {
        if (selectedProvinceCode != null && selectedProvinceCode.isNotEmpty) {
          loadWards(selectedProvinceCode, name);
        }
      },
      initialValue: "2", //dang fix cung f.value
      labelMinHeight: labelMinHeight,
    );
  }

  Widget _buildWard(FormFieldEntity f, {double? labelMinHeight}) {
    final name = f.name!;
    return _buildDropdownLike(
      f: f,
      name: name,
      options: _wards,
      initialValue: "22113002",
      labelMinHeight: labelMinHeight,
    );
  }

  Widget _buildImageArray(FormFieldEntity f) {
    final String name = f.name!;
    final int max = (f.max != null && f.max! > 0) ? f.max! : 5;
    const double size = 120;

    // Giá trị URL cũ (String) từ f.value
    final List<String> existingUrls = (f.value is List)
        ? List<String>.from(f.value!.whereType<String>())
        : [];

    Future<void> _chooseSourceAndPick() async {
      final source = await showModalBottomSheet<String>(
        context: context,
        builder: (context) => SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Chụp ảnh'),
                onTap: () => Navigator.pop(context, 'camera'),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Chọn từ thư viện'),
                onTap: () => Navigator.pop(context, 'gallery'),
              ),
            ],
          ),
        ),
      );

      if (source == null) return;

      if (source == 'camera') {
        // Mở màn hình camera custom của bạn
        final XFile? file = await Navigator.of(context).push<XFile>(
          MaterialPageRoute(
            builder: (_) => SmartCameraScreen(
              initialMode: CaptureMode.cccd, // hoặc CaptureMode.qr
            ),
          ),
        );

        if (file != null) {
          setState(() {
            _imageArrays[name]!.add(File(file.path));
            // f.value chỉ giữ URL cũ
            _formRequest = _formRequest?.copyWith(
              data: _formRequest?.data?.map((field) {
                if (field.name == name && field.type == 'image') {
                  return field.copyWith(value: existingUrls);
                }
                return field;
              }).toList(),
            );
          });
        }
      } else if (source == 'gallery') {
        final file = await _pickImageFrom(ImageSource.gallery);
        if (file != null) {
          setState(() {
            _imageArrays[name]!.add(file);
            // f.value chỉ giữ URL cũ
            _formRequest = _formRequest?.copyWith(
              data: _formRequest?.data?.map((field) {
                if (field.name == name && field.type == 'image') {
                  return field.copyWith(value: existingUrls);
                }
                return field;
              }).toList(),
            );
          });
        }
      }
    }

    Widget addTile() {
      return GestureDetector(
        onTap: () async {
          if (_imageArrays[name]!.length + existingUrls.length >= max) return;
          await _chooseSourceAndPick();
        },
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.add_a_photo, color: Colors.grey),
        ),
      );
    }

    Widget thumbTile({File? file, String? url, int? idx, bool isFile = true}) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(6),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: isFile
                  ? Image.file(file!, fit: BoxFit.cover)
                  : Image.network(url!, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: -6,
            right: -6,
            child: Material(
              elevation: 2,
              shape: const CircleBorder(),
              color: Colors.white,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () {
                  setState(() {
                    if (isFile) {
                      _imageArrays[name]!.removeAt(idx!);
                    } else {
                      existingUrls.removeAt(idx!);
                    }
                    // f.value chỉ giữ URL còn lại, không chứa File
                    _formRequest = _formRequest?.copyWith(
                      data: _formRequest?.data?.map((field) {
                        if (field.name == name && field.type == 'image') {
                          return field.copyWith(value: existingUrls);
                        }
                        return field;
                      }).toList(),
                    );
                  });
                },
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
        Text(labelWithRequired(f),
            style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            // Hiển thị URL cũ
            ...existingUrls.asMap().entries
                .map((e) => thumbTile(url: e.value, idx: e.key, isFile: false)),
            // Hiển thị File mới
            ..._imageArrays[name]!.asMap().entries
                .map((e) => thumbTile(file: e.value, idx: e.key)),
            // Thêm ảnh nếu chưa đạt max
            if (_imageArrays[name]!.length + existingUrls.length < max) addTile(),
          ],
        ),
        const SizedBox(height: 8),
        Text("Tối đa $max ảnh • Nhấn để thêm ảnh",
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
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
        return buildTextarea(f, labelMinHeight: labelMinHeight, textCtrls: _textCtrls);
      case 'date':
        return buildDate(
          context,
          f,
          dateCtrls: _dateCtrls,
          dateValues: _dateValues,
          setState: setState,
          labelMinHeight: labelMinHeight,
        );
      case 'select':
        return _buildSelect(f, labelMinHeight: labelMinHeight);
      case 'province':
        return _buildProvince(f, labelMinHeight: labelMinHeight);
      case 'ward':
        return _buildWard(f, labelMinHeight: labelMinHeight);
      case 'radio':
        return buildRadio(
          f,
          singleValues: _singleValues,
          textCtrls: _textCtrls,
          setState: setState,
        );
      case 'checkbox':
        return buildCheckbox(
          f,
          checkboxValues: _checkboxValues,
          setState: setState,
        );
      case 'multiCheckbox':
        return buildMultiCheckbox(
          f,
          multiValues: _multiValues,
          textCtrls: _textCtrls,
          setState: setState,
        );
      case 'image':
        return _buildImageArray(f);
      case 'signature':
        return buildSignature(
          f,
          _signatureController,
          setState,
          labelWithRequired,
        );
      case 'titleLarge':
        return titleLarge(f.label ?? '');
      case 'titleMedium':
        return titleMedium(f.label ?? '');
      case 'titleSmall':
        return titleSmall(f.label ?? '');
      case 'description':
        return description(f.label ?? '');
      case 'gender':
      // clone lại options từ entity
        final options = List<FormFieldOption>.from(f.options ?? []);

        // Thêm "Khác" nếu chưa có
        if (!options.any((o) => o.value == 'other')) {
          options.add(const FormFieldOption(value: 0, label: 'Khác'));
        }

        return _buildDropdownLike(
          f: f.copyWith(label: f.label ?? 'Giới tính'),
          name: f.name!,
          options: options,
          initialValue: f.value, // 🔥 đây mới là cái để hiển thị "Nam" khi f.value == "male"
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
                extras.add({"value": opt.value.toString() ?? '', "text": txt});
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
                FormFieldOption(value: 1, label: 'Nam'),
                FormFieldOption(value: 2, label: 'Nữ'),
                FormFieldOption(value: 0, label: 'Khác'),
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

  // ====== BUILD ======
  @override
  void initState() {
    super.initState();
    loadFormRequest("345cd9d1-0b4a-4089-8c5e-1ef882d18019");
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
            children: [...widgets, buildFooter()]),
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
