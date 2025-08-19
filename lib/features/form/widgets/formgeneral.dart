// ====== UI BUILDERS (typed) ======
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dynamicform/features/form/domain/form_field.entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

import '../domain/form_request.entity.dart';
import 'package:signature/signature.dart';

Widget wrapWithLabel(String label, Widget child, {double? labelMinHeight}) {
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

Widget titleLarge(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 6, bottom: 8),
    child: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  );
}

Widget titleMedium(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 6, bottom: 6),
    child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
  );
}

Widget titleSmall(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 4, bottom: 4),
    child: Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
  );
}

Widget description(String text) {
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

// Widget _buildText(FormFieldEntity f, {double? labelMinHeight}) {
//   final name = f.name!;
//   return _wrapWithLabel(
//     _labelWithRequired(f),
//     SizedBox(
//       height: 48,
//       child: TextField(
//         controller: _textCtrls[name],
//         decoration: _inputDecoration(null), // không label trong outline
//         style: const TextStyle(fontSize: 14),
//       ),
//     ),
//     labelMinHeight: labelMinHeight,
//   );
// }

String labelWithRequired(FormFieldEntity f) {
  final label = (f.label ?? '').toString();
  final isRequired = f.isRequired == true;
  return isRequired ? '$label(*)' : label;
}

Widget buildTextarea(
    FormFieldEntity f, {
      required Map<String, TextEditingController> textCtrls,
      double? labelMinHeight,
    }) {
  final name = f.name!;
  final rows = (f.row != null && f.row! > 0) ? f.row! : 3;

  // Khởi tạo controller nếu chưa có
  textCtrls[name] = textCtrls[name] ?? TextEditingController(text: f.value?.toString());

  return wrapWithLabel(
    labelWithRequired(f),
    TextField(
      controller: textCtrls[name],
      minLines: rows,
      maxLines: rows + 2,
      decoration: inputDecoration(null),
      style: const TextStyle(fontSize: 14),
      onChanged: (val) {
        textCtrls[name]?.text = val;
      },
    ),
    labelMinHeight: labelMinHeight,
  );
}

InputDecoration inputDecoration(String? label, {Widget? suffixIcon}) {
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

Widget buildRadio(
    FormFieldEntity f, {
      required Map<String, String?> singleValues,
      required Map<String, TextEditingController> textCtrls,
      required void Function(VoidCallback fn) setState,
    }) {
  final name = f.name!;
  final List<FormFieldOption> options = f.options ?? const [];

  // Ưu tiên lấy từ f.value (init value)
  final currentValue = (f.value ?? singleValues[name])?.toString();
  singleValues[name] = currentValue;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        labelWithRequired(f),
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      const SizedBox(height: 6),
      ...options.map((opt) {
        final v = opt.value?.toString();
        final isSelected = currentValue == v;
        final isExtra = opt.isExtraOption == true;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RadioListTile<String>(
              dense: true,
              visualDensity: VisualDensity.compact,
              contentPadding: EdgeInsets.zero,
              title: Text(opt.label ?? ''),
              value: v ?? '',
              groupValue: currentValue,
              onChanged: (val) {
                setState(() {
                  singleValues[name] = val;
                });
              },
            ),
            if (isExtra && isSelected)
              Padding(
                padding: const EdgeInsets.only(left: 40.0, bottom: 8),
                child: SizedBox(
                  width: 360,
                  child: TextField(
                    controller: textCtrls['${name}__extra__${v}'],
                    decoration: inputDecoration('Nhập giá trị tùy chỉnh'),
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

Widget buildDate(
    BuildContext context,
    FormFieldEntity f, {
      required Map<String, TextEditingController> dateCtrls,
      required Map<String, DateTime?> dateValues,
      required void Function(VoidCallback fn) setState,
      double? labelMinHeight,
    }) {
  final name = f.name!;

  // 1. Khởi tạo controller nếu chưa có
  dateCtrls[name] = dateCtrls[name] ?? TextEditingController();

  // 2. Lấy giá trị default từ server
  if (dateValues[name] == null && f.value != null && f.value!.isNotEmpty) {
    dateValues[name] = DateTime.tryParse(f.value!);
    if (dateValues[name] != null) {
      dateCtrls[name]!.text = DateFormat('dd/MM/yyyy').format(dateValues[name]!);
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
            initialDate: dateValues[name] ?? DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );
          if (picked != null) {
            setState(() {
              dateValues[name] = picked;
              dateCtrls[name]!.text = DateFormat('dd/MM/yyyy').format(picked);
            });
          }
        },
        child: IgnorePointer(
          child: TextField(
            controller: dateCtrls[name],
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

Widget buildFooter() {
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

Widget buildCheckbox(
    FormFieldEntity f, {
      required Map<String, bool> checkboxValues,
      required void Function(VoidCallback fn) setState,
    }) {
  final name = f.name!;
  // Ưu tiên lấy từ f.value (JSON), nếu null thì lấy trong state, cuối cùng fallback false
  final currentValue = (f.value is bool ? f.value : null) ?? checkboxValues[name] ?? false;

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      children: [
        Checkbox(
          value: currentValue,
          onChanged: (v) {
            setState(() {
              checkboxValues[name] = v ?? false;
            });
          },
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            labelWithRequired(f),
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    ),
  );
}

Widget buildMultiCheckbox(
    FormFieldEntity f, {
      required Map<String, Set<String>> multiValues,
      required Map<String, TextEditingController> textCtrls,
      required void Function(VoidCallback fn) setState,
    }) {
  final name = f.name!;
  final List<FormFieldOption> options = f.options ?? const [];

  // Khởi tạo state nếu chưa có
  multiValues[name] ??= <String>{};

  // Ưu tiên load từ f.value (JSON) nếu có
  if (f.value is List && (multiValues[name]?.isEmpty ?? true)) {
    multiValues[name] = (f.value as List).map((e) => e.toString()).toSet();
  }

  final selectedValues = multiValues[name]!;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        labelWithRequired(f),
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      const SizedBox(height: 6),
      ...options.map((opt) {
        final v = opt.value?.toString() ?? '';
        final selected = selectedValues.contains(v);
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
                    selectedValues.add(v);
                  } else {
                    selectedValues.remove(v);
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
                    controller: textCtrls['${name}__extra__${v}'],
                    decoration: inputDecoration('Nhập giá trị tùy chỉnh'),
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


Widget buildSignature(
    FormFieldEntity f,
    SignatureController signatureController,
    void Function(VoidCallback fn) setState,
    String Function(FormFieldEntity f) labelWithRequired,
    ) {
  Uint8List? existingSignature;
  if (f.value != null && f.value!.isNotEmpty) {
    try {
      existingSignature = base64Decode(f.value!.split(',').last);
    } catch (e) {
      debugPrint("Cannot decode signature: $e");
    }
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(labelWithRequired(f), style: const TextStyle(fontWeight: FontWeight.w500)),
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
                if (existingSignature != null)
                  Image.memory(existingSignature, fit: BoxFit.contain),
                Signature(
                  controller: signatureController,
                  backgroundColor: Colors.white.withOpacity(existingSignature != null ? 0.5 : 1),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.clear, size: 20),
                        tooltip: "Xóa chữ ký",
                        onPressed: () {
                          setState(() {
                            signatureController.clear();
                            f = f.copyWith(value: null);
                            existingSignature = null;
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.check, size: 20),
                        tooltip: "Lưu chữ ký",
                        onPressed: () async {
                          final data = await signatureController.toPngBytes();
                          if (data != null) {
                            setState(() {
                              f = f.copyWith(
                                value: "data:image/png;base64," + base64Encode(data),
                              );
                            });
                          }
                        },
                      ),
                    ],
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







/// Hiển thị mảng ảnh, hỗ trợ thêm/xoá
Widget buildImageArray({
  required BuildContext context,
  required FormFieldEntity f,
  required Map<String, List<File>> imageArrays,
  required dynamic formRequest, // Freezed object của bạn
  required Function setState,
  required Future<File?> Function(ImageSource source) pickImageFrom,
  required String Function(FormFieldEntity f) labelWithRequired,
}) {
  final String name = f.name!;
  final int max = (f.max != null && f.max! > 0) ? f.max! : 5;

  // Chuyển List<dynamic → List<String> an toàn
  final existingUrls = (f.value is List)
      ? (f.value as List).whereType<String>().toList()
      : <String>[];

  // Hàm cập nhật lại _formRequest.data
  void _updateFormRequest() {
    formRequest = formRequest?.copyWith(
      data: formRequest?.data
          ?.map((field) {
        if (field.name == name && field.type == 'image') {
          return field.copyWith(value: existingUrls);
        }
        return field;
      })
          .toList()
          .cast<FormFieldEntity>(),
    );
  }

  // Chọn ảnh từ camera hoặc thư viện
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
      final file = await pickImageFrom(source);
      if (file != null) {
        setState(() {
          imageArrays[name]!.add(file);
          _updateFormRequest();
        });
      }
    }
  }

  // Widget hiển thị 1 ảnh (file hoặc URL)
  Widget thumbTile({File? file, String? url, int? idx, bool isFile = true}) {
    const double size = 120;
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
                    imageArrays[name]!.removeAt(idx!);
                  } else {
                    existingUrls.removeAt(idx!);
                  }
                  _updateFormRequest(); // cập nhật lại formRequest ngay
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

  // Widget nút thêm ảnh
  Widget addTile() {
    const double size = 120;
    return GestureDetector(
      onTap: () async {
        if (imageArrays[name]!.length + existingUrls.length >= max) return;
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
          // URL cũ
          ...existingUrls.asMap().entries
              .map((e) => thumbTile(url: e.value, idx: e.key, isFile: false)),
          // File mới
          ...imageArrays[name]!.asMap().entries
              .map((e) => thumbTile(file: e.value, idx: e.key)),
          // Thêm ảnh nếu chưa đủ max
          if (imageArrays[name]!.length + existingUrls.length < max)
            addTile(),
        ],
      ),
      const SizedBox(height: 8),
      Text(
        "Tối đa $max ảnh • Nhấn để thêm ảnh",
        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
      ),
    ],
  );
}



