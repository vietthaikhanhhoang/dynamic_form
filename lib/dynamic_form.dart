// giữ nguyên tên file / class: SecondPage
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
  // controllers / state cho các field
  final Map<String, TextEditingController> _controllers = {};
  final Map<String, String?> _dropdownValues = {};
  final Map<String, DateTime?> _dateValues = {};

  // ảnh thumbnail 120x120
  File? portraitImage;
  File? idFrontImage;
  File? idBackImage;

  bool videoConfirmed = false;

  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  final List<Map<String, dynamic>> fields = [
    // I. THÔNG TIN THUÊ BAO
    {
      "label": "Họ và tên khách hàng",
      "type": "text",
      "name": "customer_name",
      "col": 6,
    },
    {
      "label": "Giới tính",
      "type": "dropdown",
      "name": "gender",
      "options": ["Nam", "Nữ", "Khác"],
      "col": 6,
    },
    {
      "label": "Ngày sinh",
      "type": "date",
      "name": "dob",
      "col": 6,
    },
    {
      "label": "Số thuê bao",
      "type": "text",
      "name": "phone_number",
      "col": 6,
    },
    {
      "label": "Mã hợp đồng",
      "type": "text",
      "name": "contract_code",
      "col": 12,
    },
    {
      "label": "Số CMND/CCCD/HC/GPKD",
      "type": "text",
      "name": "id_number",
      "col": 12,
    },
    {
      "label": "Ngày cấp",
      "type": "date",
      "name": "issue_date",
      "col": 6,
    },
    {
      "label": "Nơi cấp",
      "type": "text",
      "name": "issue_place",
      "col": 6,
    },
    {
      "label": "Địa chỉ thường trú",
      "type": "textarea",
      "name": "address",
      "col": 12,
    },
    {
      "label": "Phường/xã",
      "type": "dropdown",
      "name": "ward",
      "options": ["Phường 1", "Phường 2", "Phường 3"],
      "col": 6,
    },
    {
      "label": "Tỉnh/thành phố",
      "type": "dropdown",
      "name": "city",
      "options": ["Hà Nội", "TP.HCM", "Đà Nẵng"],
      "col": 6,
    },

    // II. NỘI DUNG YÊU CẦU
    {
      "label": "Gói cước gốc",
      "type": "text",
      "name": "original_package",
      "col": 6,
    },
    {
      "label": "Gói cước đích",
      "type": "text",
      "name": "target_package",
      "col": 6,
    },
    {
      "label": "Áp dụng từ ngày",
      "type": "date",
      "name": "apply_date",
      "col": 12,
    },
  ];

  @override
  void initState() {
    super.initState();
    for (var field in fields) {
      if (field['type'] == 'text' || field['type'] == 'textarea') {
        _controllers[field['name']] = TextEditingController();
      } else if (field['type'] == 'dropdown') {
        _dropdownValues[field['name']] = null;
      } else if (field['type'] == 'date') {
        _dateValues[field['name']] = null;
      }
    }
  }

  @override
  void dispose() {
    for (var c in _controllers.values) {
      c.dispose();
    }
    _signatureController.dispose();
    super.dispose();
  }

  // style input giống file gốc
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

  // PICK IMAGE (gallery). giữ gọn và reusable
  Future<File?> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery, imageQuality: 75);
    if (picked == null) return null;
    return File(picked.path);
  }

  // Widget image picker tile (120x120, bo góc, border mảnh, delete icon)
  Widget _imagePickerField({
    required String label,
    required File? imageFile,
    required void Function(File?) onChanged,
  }) {
    const double size = 120;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        Row(
          children: [
            Stack(
              children: [
                // container border + rounded corners
                GestureDetector(
                  onTap: () async {
                    final f = await _pickImageFromGallery();
                    if (f != null) onChanged(f);
                  },
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: imageFile != null
                          ? Image.file(imageFile, fit: BoxFit.cover, width: size, height: size)
                          : Center(
                        child: Icon(Icons.camera_alt, color: Colors.grey.shade500, size: 28),
                      ),
                    ),
                  ),
                ),
                // delete icon (top-right) - only show if image exists
                if (imageFile != null)
                  Positioned(
                    top: -6,
                    right: -6,
                    child: Material(
                      elevation: 2,
                      shape: const CircleBorder(),
                      color: Colors.white,
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () => onChanged(null),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Icon(
                            Icons.delete_outline,
                            size: 20,
                            color: Colors.red.shade400,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            // khoảng trống để hiển thị hướng dẫn ngắn giống mẫu, nếu cần
            Expanded(
              child: Text(
                "Kích thước ảnh: 120x120\nNhấn để chọn ảnh",
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            )
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  // Signature field with clear icon — border liền nét
  Widget _signatureField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Khách hàng yêu cầu ký tên", style: TextStyle(fontWeight: FontWeight.w500)),
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
        const SizedBox(height: 12),
      ],
    );
  }

  // Build single field widget (text, textarea, dropdown, date)
  Widget _buildField(Map<String, dynamic> field) {
    switch (field['type']) {
      case 'text':
        return TextField(
          controller: _controllers[field['name']],
          decoration: _inputDecoration(field['label']),
          style: const TextStyle(fontSize: 14),
        );
      case 'textarea':
        return TextField(
          controller: _controllers[field['name']],
          decoration: _inputDecoration(field['label']),
          minLines: 3,
          maxLines: 5,
          style: const TextStyle(fontSize: 14),
        );
      case 'dropdown':
        return DropdownButtonFormField<String>(
          value: _dropdownValues[field['name']],
          decoration: _inputDecoration(field['label']),
          items: (field['options'] as List<String>)
              .map((opt) => DropdownMenuItem(value: opt, child: Text(opt, style: const TextStyle(fontSize: 14))))
              .toList(),
          onChanged: (val) => setState(() => _dropdownValues[field['name']] = val),
        );
      case 'date':
        return InkWell(
          onTap: () async {
            DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );
            if (picked != null) setState(() => _dateValues[field['name']] = picked);
          },
          child: IgnorePointer(
            child: TextField(
              decoration: _inputDecoration(
                field['label'],
                suffixIcon: Icon(Icons.calendar_today, size: 18, color: Colors.grey.shade600),
              ).copyWith(
                hintText: 'Chọn thời điểm',
                hintStyle: TextStyle(color: Colors.grey.shade400),
              ),
              controller: TextEditingController(
                text: _dateValues[field['name']] != null ? DateFormat('dd/MM/yyyy').format(_dateValues[field['name']]!) : '',
              ),
              style: const TextStyle(fontSize: 14),
            ),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  // build form sections I & II from fields array
  List<Widget> _buildFormFields() {
    final List<Widget> rows = [];

    rows.add(const Text("I. THÔNG TIN THUÊ BAO", style: TextStyle(fontWeight: FontWeight.bold)));
    rows.add(const SizedBox(height: 8));

    for (int i = 0; i < fields.length; i++) {
      // insert section header for II
      if (i == 12) {
        rows.add(const SizedBox(height: 12));
        rows.add(const Text("II. NỘI DUNG YÊU CẦU", style: TextStyle(fontWeight: FontWeight.bold)));
        rows.add(const SizedBox(height: 8));
      }

      final field = fields[i];
      if (field['col'] == 12) {
        rows.add(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(field['label'], style: const TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 6),
            _buildField(field),
            const SizedBox(height: 12),
          ],
        ));
      } else {
        final nextIndex = i + 1;
        final hasPair = nextIndex < fields.length && fields[nextIndex]['col'] == 6;
        final secondField = hasPair ? fields[nextIndex] : null;

        rows.add(Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(field['label'], style: const TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 6),
                  _buildField(field),
                ],
              ),
            ),
            if (secondField != null) ...[
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(secondField['label'], style: const TextStyle(fontWeight: FontWeight.w500)),
                    const SizedBox(height: 6),
                    _buildField(secondField),
                  ],
                ),
              ),
            ],
          ],
        ));
        rows.add(const SizedBox(height: 12));
        if (secondField != null) i++; // skip next because paired
      }
    }

    return rows;
  }

  // toàn bộ form kết hợp các section III & IV
  List<Widget> _buildFullForm() {
    final List<Widget> widgets = [];
    widgets.addAll(_buildFormFields());

    // III. ĐÍNH KÈM
    widgets.add(const SizedBox(height: 12));
    widgets.add(const Text("III. ĐÍNH KÈM", style: TextStyle(fontWeight: FontWeight.bold)));
    widgets.add(const SizedBox(height: 8));

    widgets.add(_imagePickerField(
      label: "Ảnh chân dung",
      imageFile: portraitImage,
      onChanged: (f) => setState(() => portraitImage = f),
    ));

    widgets.add(_imagePickerField(
      label: "Ảnh CCCD mặt trước",
      imageFile: idFrontImage,
      onChanged: (f) => setState(() => idFrontImage = f),
    ));

    widgets.add(_imagePickerField(
      label: "Ảnh CCCD mặt sau",
      imageFile: idBackImage,
      onChanged: (f) => setState(() => idBackImage = f),
    ));

    // IV. XÁC NHẬN
    widgets.add(const SizedBox(height: 12));
    widgets.add(const Text("IV. XÁC NHẬN", style: TextStyle(fontWeight: FontWeight.bold)));
    widgets.add(const SizedBox(height: 8));
    widgets.add(_signatureField());

    // Checkbox with controlled padding so icon aligns nicely
    widgets.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0), // cùng padding với các item khác
        child: Row(
          children: [
            Checkbox(
              value: videoConfirmed,
              onChanged: (v) => setState(() => videoConfirmed = v ?? false),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // icon gọn
              visualDensity: VisualDensity.compact, // giảm khoảng trống
            ),
            const SizedBox(width: 6), // giảm khoảng cách icon ↔ text
            const Expanded(
              child: Text(
                "Xác nhận đã gọi Video cho khách hàng",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );

    return widgets;
  }

  void _submitForm() async {
    final Map<String, dynamic> result = {};
    _controllers.forEach((key, c) => result[key] = c.text);
    _dropdownValues.forEach((k, v) => result[k] = v);
    _dateValues.forEach((k, v) => result[k] = v != null ? DateFormat('dd/MM/yyyy').format(v) : null);

    result['portrait_image'] = portraitImage?.path;
    result['id_front_image'] = idFrontImage?.path;
    result['id_back_image'] = idBackImage?.path;
    result['video_confirmed'] = videoConfirmed;

    // nếu cần export signature as png bytes, có thể dùng:
    // final signatureBytes = await _signatureController.toPngBytes();
    // result['signature_bytes'] = signatureBytes;

    debugPrint(result.toString());
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã lưu tạm form (xem debugPrint)')));
  }

  // header + footer giữ nguyên style trước
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
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("VNPT BÌNH THUẬN", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                  Text("Số điện thoại: 18001091", style: TextStyle(fontSize: 13), overflow: TextOverflow.ellipsis),
                  Text("Địa chỉ: 123 Trần Hưng Đạo, Phan Thiết", style: TextStyle(fontSize: 13), overflow: TextOverflow.ellipsis),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Phiếu yêu cầu")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildHeader(),
          ..._buildFullForm(),
          _buildFooter(),
        ]),
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
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Xác nhận hoàn thành", style: TextStyle(fontSize: 14, color: Colors.white)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    side: const BorderSide(color: Colors.blue),
                  ),
                  child: const Text("Xem trước", style: TextStyle(fontSize: 14, color: Colors.blue)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
