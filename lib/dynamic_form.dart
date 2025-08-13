// giữ nguyên tên file / class: SecondPage
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signature/signature.dart';

class dynamic_form extends StatefulWidget {
  const dynamic_form({super.key});

  @override
  State<dynamic_form> createState() => _dynamic_formState();
}

class _dynamic_formState extends State<dynamic_form> {
  // ====== MOCK API JSON (đúng format bạn yêu cầu) ======
  // Có đủ các type để test.
  final Map<String, dynamic> _apiResponse = {
    "status": "success",
    "message": "Get form request success",
    "data": {
      "id": "test-form-id",
      "title": "Form test đủ type",
      "data": [
        {
          "type": "titleLarge",
          "label": "I. THÔNG TIN CÁ NHÂN",
          "colSm": 12,
          "colMd": 12,
          "colLg": 12,
          "valueIsArray": false
        },
        {
          "type": "text",
          "label": "Họ và tên",
          "name": "fullName",
          "isRequired": true,
          "colSm": 12,
          "colMd": 6,
          "colLg": 6,
          "valueIsArray": false
        },
        {
          "type": "date",
          "label": "Ngày sinh",
          "name": "birthDate",
          "colSm": 12,
          "colMd": 6,
          "colLg": 6,
          "valueIsArray": false
        },
        {
          "type": "gender",
          "label": "Giới tính",
          "name": "gender",
          "colSm": 12,
          "colMd": 6,
          "colLg": 6,
          "valueIsArray": false
        },
        {
          "type": "select",
          "label": "Nghề nghiệp",
          "name": "jobSelect",
          "nameSaveLabel": "jobLabel",
          "nameSaveExtraOption": "jobExtra",
          "options": [
            {"value": "office", "label": "Văn phòng"},
            {"value": "it", "label": "CNTT"},
            {"value": "other", "label": "Khác", "isExtraOption": true}
          ],
          "colSm": 12,
          "colMd": 6,
          "colLg": 6,
          "valueIsArray": false
        },
        {
          "type": "checkbox",
          "label": "Đăng ký nhận tin khuyến mãi",
          "name": "promoCheckbox",
          "nameSaveLabel": "promoLabel",
          "colSm": 12,
          "colMd": 6,
          "colLg": 6,
          "valueIsArray": false
        },
        {
          "type": "multiCheckbox",
          "label": "Sở thích",
          "name": "hobbies",
          "nameSaveLabel": "hobbiesLabel",
          "nameSaveExtraOption": "hobbiesExtra",
          "options": [
            {"value": "book", "label": "Đọc sách"},
            {"value": "travel", "label": "Du lịch"},
            {"value": "music", "label": "Nghe nhạc", "isExtraOption": true},
            {"value": "sport", "label": "Thể thao", "isExtraOption": true}
          ],
          "colSm": 12,
          "colMd": 6,
          "colLg": 6,
          "valueIsArray": true
        },
        {
          "type": "radio",
          "label": "Trình độ học vấn",
          "name": "education",
          "nameSaveLabel": "educationLabel",
          "nameSaveExtraOption": "educationExtra",
          "options": [
            {"value": "college", "label": "Cao đẳng"},
            {"value": "university", "label": "Đại học"},
            {"value": "other", "label": "Khác", "isExtraOption": true}
          ],
          "colSm": 12,
          "colMd": 6,
          "colLg": 6,
          "valueIsArray": false
        },
        {
          "type": "province",
          "label": "Tỉnh/Thành phố",
          "name": "province",
          "nameSaveLabel": "provinceLabel",
          "colSm": 12,
          "colMd": 6,
          "colLg": 6,
          "valueIsArray": false
        },
        {
          "type": "ward",
          "label": "Phường/Xã",
          "name": "ward",
          "nameSaveLabel": "wardLabel",
          "colSm": 12,
          "colMd": 6,
          "colLg": 6,
          "valueIsArray": false
        },
        {
          "type": "textarea",
          "label": "Ghi chú",
          "name": "note",
          "row": 5,
          "colSm": 12,
          "colMd": 12,
          "colLg": 12,
          "valueIsArray": false
        },
        {
          "type": "titleMedium",
          "label": "II. TÀI LIỆU ĐÍNH KÈM",
          "colSm": 12,
          "colMd": 12,
          "colLg": 12,
          "valueIsArray": false
        },
        {
          "type": "image",
          "label": "Ảnh CCCD",
          "name": "idCardImages",
          "colSm": 12,
          "colMd": 12,
          "colLg": 12,
          "valueIsArray": true,
          "max": 2
        },
        {
          "type": "signature",
          "label": "Chữ ký khách hàng",
          "name": "signature",
          "colSm": 12,
          "colMd": 12,
          "colLg": 12,
          "valueIsArray": false
        },
        // {
        //   "type": "description",
        //   "label": "Vui lòng kiểm tra kỹ thông tin trước khi gửi.",
        //   "colSm": 12,
        //   "colMd": 12,
        //   "colLg": 12,
        //   "valueIsArray": false
        // }
        {
          "type": "checkbox",
          "label": "Vui lòng xác nhận hoàn thành",
          "name": "promoCheckbox",
          "nameSaveLabel": "promoLabel",
          "colSm": 12,
          "colMd": 6,
          "colLg": 6,
          "valueIsArray": false
        },
      ],
      "created_at": "2025-08-12T23:06:31.785357+07:00",
      "updated_at": "2025-08-12T23:06:31.785357+07:00"
    }
  };

  // ====== STATE MAPS (dynamic theo JSON) ======
  // text/textarea + extra text input (select/radio/multiCheckbox khi isExtraOption)
  final Map<String, TextEditingController> _textCtrls = {};
  // date
  final Map<String, DateTime?> _dateValues = {};
  // select/radio/province/ward/gender (single value)
  final Map<String, String?> _singleValues = {};
  // checkbox (bool)
  final Map<String, bool> _checkboxValues = {};
  // multiCheckbox (nhiều giá trị)
  final Map<String, Set<String>> _multiValues = {};
  // image arrays
  final Map<String, List<File>> _imageArrays = {};

  // Signature
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  // ====== CONSTANTS (fake data cho province/ward) ======
  final List<Map<String, String>> _fakeProvinces = const [
    {"value": "HN", "label": "Hà Nội"},
    {"value": "HCM", "label": "TP.HCM"},
    {"value": "DN", "label": "Đà Nẵng"},
  ];
  final List<Map<String, String>> _fakeWards = const [
    {"value": "P1", "label": "Phường 1"},
    {"value": "P2", "label": "Phường 2"},
    {"value": "P3", "label": "Phường 3"},
  ];

  List<Map<String, dynamic>> get _spec =>
      List<Map<String, dynamic>>.from(_apiResponse["data"]["data"]);

  @override
  void initState() {
    super.initState();
    _initControllersFromSpec();
  }

  @override
  void dispose() {
    for (final c in _textCtrls.values) {
      c.dispose();
    }
    _signatureController.dispose();
    super.dispose();
  }

  // ====== STYLE input giống code cũ ======
  InputDecoration _inputDecoration(String label, {Widget? suffixIcon}) {
    return InputDecoration(
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
      suffixIcon: suffixIcon != null
          ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(height: 20, width: 20, child: suffixIcon),
      )
          : null,
    );
  }

  // ====== IMAGE PICKER (gallery) ======
  Future<File?> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 75,
    );
    if (picked == null) return null;
    return File(picked.path);
  }

  // ====== INIT CONTROLLERS/STATE THEO SPEC ======
  void _initControllersFromSpec() {
    for (final f in _spec) {
      final type = f['type'];
      final name = f['name'];

      if (type == 'text' || type == 'textarea') {
        _textCtrls[name] = TextEditingController();
      } else if (type == 'date') {
        _dateValues[name] = null;
      } else if (type == 'select' ||
          type == 'radio' ||
          type == 'province' ||
          type == 'ward' ||
          type == 'gender') {
        _singleValues[name] = null;
        // extra input cho select/radio khi option isExtraOption
        if (f['nameSaveExtraOption'] != null) {
          // key extra text cho single: "<name>__extra"
          _textCtrls['${name}__extra'] = TextEditingController();
        }
      } else if (type == 'checkbox') {
        _checkboxValues[name] = false;
      } else if (type == 'multiCheckbox') {
        _multiValues[name] = <String>{};
        // extra input theo từng option: "<name>__extra__<value>"
        if (f['options'] != null) {
          for (final opt in f['options']) {
            if (opt['isExtraOption'] == true) {
              _textCtrls['${name}__extra__${opt['value']}'] =
                  TextEditingController();
            }
          }
        }
      } else if (type == 'image') {
        _imageArrays[name] = <File>[];
      } else if (type == 'signature') {
        // đã có _signatureController
      }
    }
  }

  // ====== HELPERS ======
  String _labelWithRequired(Map<String, dynamic> f) {
    final label = (f['label'] ?? '').toString();
    final isRequired = f['isRequired'] == true;
    return isRequired ? '$label(*)' : label;
  }

  bool _isCurrentSelectionExtra(Map<String, dynamic> field) {
    final type = field['type'];
    if (type != 'select' && type != 'radio') return false;
    final name = field['name'];
    final selected = _singleValues[name];
    if (selected == null) return false;
    final options = List<Map<String, dynamic>>.from(field['options'] ?? const []);
    final opt = options.firstWhere(
          (o) => o['value'] == selected,
      orElse: () => {},
    );
    return opt.isNotEmpty && (opt['isExtraOption'] == true);
  }

  String? _labelForOption(List<Map<String, dynamic>> options, String? value) {
    if (value == null) return null;
    final found =
    options.firstWhere((o) => o['value'] == value, orElse: () => {});
    return found.isEmpty ? null : (found['label']?.toString());
  }

  // ====== UI BUILDERS ======
  Widget _wrapWithLabel(String label, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        child,
      ],
    );
  }

  Widget _titleLarge(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _titleMedium(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 6),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _titleSmall(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
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

  Widget _buildText(Map<String, dynamic> f) {
    final name = f['name'];
    return _wrapWithLabel(
      _labelWithRequired(f),
      TextField(
        controller: _textCtrls[name],
        decoration: _inputDecoration(f['label']),
        style: const TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _buildTextarea(Map<String, dynamic> f) {
    final name = f['name'];
    final rows = (f['row'] is int && f['row'] > 0) ? f['row'] as int : 3;
    return _wrapWithLabel(
      _labelWithRequired(f),
      TextField(
        controller: _textCtrls[name],
        minLines: rows,
        maxLines: rows + 2,
        decoration: _inputDecoration(f['label']),
        style: const TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _buildDate(Map<String, dynamic> f) {
    final name = f['name'];
    return _wrapWithLabel(
      _labelWithRequired(f),
      InkWell(
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
            decoration: _inputDecoration(
              f['label'],
              suffixIcon: Icon(Icons.calendar_today,
                  size: 18, color: Colors.grey.shade600),
            ).copyWith(
              hintText: 'Chọn thời điểm',
              hintStyle: TextStyle(color: Colors.grey.shade400),
            ),
            controller: TextEditingController(
              text: _dateValues[name] != null
                  ? DateFormat('dd/MM/yyyy').format(_dateValues[name]!)
                  : '',
            ),
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownLike(
      {required Map<String, dynamic> f,
        required List<Map<String, dynamic>> options,
        required String name}) {
    return _wrapWithLabel(
      _labelWithRequired(f),
      DropdownButtonFormField<String>(
        value: _singleValues[name],
        decoration: _inputDecoration(f['label']),
        items: options
            .map((opt) => DropdownMenuItem<String>(
          value: opt['value'].toString(),
          child: Text(opt['label'].toString(),
              style: const TextStyle(fontSize: 14)),
        ))
            .toList(),
        onChanged: (v) => setState(() {
          _singleValues[name] = v;
        }),
      ),
    );
  }

  Widget _buildSelect(Map<String, dynamic> f) {
    final name = f['name'];
    final List<Map<String, dynamic>> options =
    List<Map<String, dynamic>>.from(f['options'] ?? const []);
    final nameSaveExtra = f['nameSaveExtraOption'];

    final select = _buildDropdownLike(f: f, options: options, name: name);

    // nếu chọn option isExtraOption => hiện ô input phụ
    if (nameSaveExtra != null && _isCurrentSelectionExtra(f)) {
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

  Widget _buildRadio(Map<String, dynamic> f) {
    final name = f['name'];
    final nameSaveExtra = f['nameSaveExtraOption'];
    final List<Map<String, dynamic>> options =
    List<Map<String, dynamic>>.from(f['options'] ?? const []);

    final radios = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_labelWithRequired(f),
            style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        ...options.map((opt) {
          final v = opt['value'].toString();
          final isSelected = _singleValues[name] == v;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadioListTile<String>(
                dense: true,
                visualDensity: VisualDensity.compact,
                contentPadding: EdgeInsets.zero,
                title: Text(opt['label'].toString()),
                value: v,
                groupValue: _singleValues[name],
                onChanged: (val) => setState(() => _singleValues[name] = val),
              ),
              if (nameSaveExtra != null &&
                  opt['isExtraOption'] == true &&
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

    return radios;
  }

  Widget _buildCheckbox(Map<String, dynamic> f) {
    final name = f['name'];
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
          Expanded(
            child: Text(
              _labelWithRequired(f),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMultiCheckbox(Map<String, dynamic> f) {
    final name = f['name'];
    final List<Map<String, dynamic>> options =
    List<Map<String, dynamic>>.from(f['options'] ?? const []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_labelWithRequired(f),
            style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        ...options.map((opt) {
          final v = opt['value'].toString();
          final selected = _multiValues[name]!.contains(v);
          final isExtra = opt['isExtraOption'] == true;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CheckboxListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                contentPadding: EdgeInsets.zero,
                title: Text(opt['label'].toString()),
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

  Widget _buildProvince(Map<String, dynamic> f) {
    final name = f['name'];
    return _buildDropdownLike(
      f: f,
      name: name,
      options: _fakeProvinces,
    );
  }

  Widget _buildWard(Map<String, dynamic> f) {
    final name = f['name'];
    return _buildDropdownLike(
      f: f,
      name: name,
      options: _fakeWards,
    );
  }

  // Image array (tối đa max), thumbnail 120x120, delete icon, nút + thêm
  Widget _buildImageArray(Map<String, dynamic> f) {
    final String name = f['name'];
    final int max = (f['max'] is int && f['max'] > 0) ? f['max'] : 5;
    const double size = 120;

    Future<void> addImage() async {
      if (_imageArrays[name]!.length >= max) return;
      final file = await _pickImageFromGallery();
      if (file != null) {
        setState(() => _imageArrays[name]!.add(file));
      }
    }

    Widget thumbTile(File file, int idx) {
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
              child: Image.file(file, fit: BoxFit.cover),
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
                onTap: () => setState(() => _imageArrays[name]!.removeAt(idx)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Icon(Icons.delete_outline,
                      size: 20, color: Colors.red.shade400),
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget addTile() {
      final canAdd = _imageArrays[name]!.length < max;
      return GestureDetector(
        onTap: canAdd ? addImage : null,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Icon(
              canAdd ? Icons.add_a_photo : Icons.lock,
              size: 28,
              color: Colors.grey.shade500,
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_labelWithRequired(f),
            style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ..._imageArrays[name]!
                .asMap()
                .entries
                .map((e) => thumbTile(e.value, e.key)),
            addTile(),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "Tối đa $max ảnh • Nhấn để thêm ảnh từ thư viện",
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _buildSignature(Map<String, dynamic> f) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_labelWithRequired(f),
            style: const TextStyle(fontWeight: FontWeight.w500)),
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
                  Signature(
                    controller: _signatureController,
                    backgroundColor: Colors.white,
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
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

  // ====== BUILD SINGLE FIELD FROM SPEC ======
  Widget _buildField(Map<String, dynamic> f) {
    final type = (f['type'] ?? '').toString();
    switch (type) {
      case 'text':
        return _buildText(f);
      case 'textarea':
        return _buildTextarea(f);
      case 'date':
        return _buildDate(f);
      case 'select':
        return _buildSelect(f);
      case 'radio':
        return _buildRadio(f);
      case 'checkbox':
        return _buildCheckbox(f);
      case 'multiCheckbox':
        return _buildMultiCheckbox(f);
      case 'province':
        return _buildProvince(f);
      case 'ward':
        return _buildWard(f);
      case 'image':
        return _buildImageArray(f);
      case 'signature':
        return _buildSignature(f);
      case 'titleLarge':
        return _titleLarge(f['label'] ?? '');
      case 'titleMedium':
        return _titleMedium(f['label'] ?? '');
      case 'titleSmall':
        return _titleSmall(f['label'] ?? '');
      case 'description':
        return _description(f['label'] ?? '');
      case 'gender':
      // render như dropdown (Nam/Nữ/Khác) cho đồng nhất style input
        return _buildDropdownLike(
          f: {
            ...f,
            "label": f['label'] ?? 'Giới tính',
          },
          name: f['name'],
          options: const [
            {"value": "Nam", "label": "Nam"},
            {"value": "Nữ", "label": "Nữ"},
            {"value": "Khác", "label": "Khác"},
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }

  // ====== LAYOUT: pair colMd=6 với colMd=6, còn lại full width ======
  List<Widget> _buildFormFromSpec() {
    final widgets = <Widget>[];

    int i = 0;
    while (i < _spec.length) {
      final f = _spec[i];
      final type = f['type'];

      // Các title/description luôn full width
      if (type == 'titleLarge' ||
          type == 'titleMedium' ||
          type == 'titleSmall' ||
          type == 'description' ||
          f['colMd'] == 12 ||
          i == _spec.length - 1 ||
          _spec[i + 1]['colMd'] != 6 ||
          f['colMd'] != 6) {
        widgets.add(_buildField(f));
        widgets.add(const SizedBox(height: 12));
        i++;
        continue;
      }

      // Pair 6-6
      final g = _spec[i + 1];
      if (f['colMd'] == 6 && g['colMd'] == 6) {
        widgets.add(Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildField(f),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildField(g),
                ],
              ),
            ),
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

  // ====== SUBMIT: gom kết quả theo quy tắc valueIsArray ======
  void _submitForm() async {
    final Map<String, dynamic> result = {};

    for (final f in _spec) {
      final type = f['type'];
      final name = f['name'];
      final isArray = f['valueIsArray'] == true;
      final saveLabelKey = f['nameSaveLabel'];
      final saveExtraKey = f['nameSaveExtraOption'];

      if (type == 'text' || type == 'textarea') {
        result[name] = _textCtrls[name]?.text ?? '';
      } else if (type == 'date') {
        final dt = _dateValues[name];
        result[name] = (dt != null) ? DateFormat('dd/MM/yyyy').format(dt) : null;
      } else if (type == 'select' || type == 'radio') {
        final selected = _singleValues[name];
        result[name] = selected;
        // labels
        final options =
        List<Map<String, dynamic>>.from(f['options'] ?? const []);
        result[saveLabelKey ?? ''] =
        saveLabelKey != null ? _labelForOption(options, selected) : null;

        // extra
        if (saveExtraKey != null) {
          if (_isCurrentSelectionExtra(f)) {
            result[saveExtraKey] = _textCtrls['${name}__extra']?.text ?? '';
          } else {
            result[saveExtraKey] = null;
          }
        }
      } else if (type == 'checkbox') {
        final val = _checkboxValues[name] ?? false;
        result[name] = val;
        if (saveLabelKey != null) {
          // lưu label khi true, else null (có thể điều chỉnh theo backend)
          result[saveLabelKey] = val ? (f['label']?.toString() ?? '') : null;
        }
      } else if (type == 'multiCheckbox') {
        final selected = _multiValues[name]!.toList();
        result[name] = isArray ? selected : (selected.isEmpty ? null : selected.first);

        final options =
        List<Map<String, dynamic>>.from(f['options'] ?? const []);
        if (saveLabelKey != null) {
          final labels = <String>[];
          for (final v in selected) {
            final lb = _labelForOption(options, v);
            if (lb != null) labels.add(lb);
          }
          result[saveLabelKey] = labels;
        }
        if (saveExtraKey != null) {
          // Lưu danh sách {value, text} cho các option extra được chọn
          final extras = <Map<String, String>>[];
          for (final opt in options) {
            if (opt['isExtraOption'] == true &&
                _multiValues[name]!.contains(opt['value'])) {
              final key = '${name}__extra__${opt['value']}';
              final txt = _textCtrls[key]?.text ?? '';
              extras.add({"value": opt['value'].toString(), "text": txt});
            }
          }
          result[saveExtraKey] = extras;
        }
      } else if (type == 'province' || type == 'ward' || type == 'gender') {
        final selected = _singleValues[name];
        result[name] = selected;
        if (saveLabelKey != null) {
          // Tìm label từ fake options tương ứng
          List<Map<String, dynamic>> options = const [];
          if (type == 'province') {
            options = _fakeProvinces;
          } else if (type == 'ward') {
            options = _fakeWards;
          } else if (type == 'gender') {
            options = const [
              {"value": "Nam", "label": "Nam"},
              {"value": "Nữ", "label": "Nữ"},
              {"value": "Khác", "label": "Khác"},
            ];
          }
          result[saveLabelKey] = _labelForOption(options, selected);
        }
      } else if (type == 'image') {
        final paths = _imageArrays[name]!.map((f) => f.path).toList();
        result[name] = isArray ? paths : (paths.isEmpty ? null : paths.first);
      } else if (type == 'signature') {
        // Bạn có thể export PNG bytes nếu cần:
        // final bytes = await _signatureController.toPngBytes();
        // result['${name}_bytesLength'] = bytes?.length;
        result[name] = _signatureController.isNotEmpty;
      }
    }

    debugPrint(jsonEncode(result));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã lưu tạm form (xem debugPrint)')),
    );
  }

  // ====== HEADER/FOOTER giữ nguyên style ======
  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/VNPT_logo.svg/512px-VNPT_logo.svg.png",
              width: 50,
              height: 50,
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.error),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("VNPT BÌNH THUẬN",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis),
                  Text("Số điện thoại: 18001091",
                      style: TextStyle(fontSize: 13),
                      overflow: TextOverflow.ellipsis),
                  Text("Địa chỉ: 123 Trần Hưng Đạo, Phan Thiết",
                      style: TextStyle(fontSize: 13),
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }

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
              width: 30,
              height: 30,
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.error, size: 30),
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
  Widget build(BuildContext context) {
    final widgets = _buildFormFromSpec();
    return Scaffold(
      appBar: AppBar(title: const Text("Phiếu yêu cầu")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ ...widgets, _buildFooter()]),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Xác nhận hoàn thành",
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
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
