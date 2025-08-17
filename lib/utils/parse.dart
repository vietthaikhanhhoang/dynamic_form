String parseAddress({String? address, String? ward, String? province}) {
  final list = [
    address,
    ward,
    province,
  ].where((item) => item != null && item.isNotEmpty);
  return list.join(', ');
}
