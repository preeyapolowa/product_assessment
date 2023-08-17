class ContactInfoRequest {
  final String email;
  final String name;
  final String phoneNumber;
  final String address;
  final String province;
  final String postalCode;
  final String country;

  ContactInfoRequest({
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.province,
    required this.postalCode,
    required this.country,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['address'] = address;
    data['province'] = province;
    data['postal_code'] = int.parse(postalCode);
    data['country'] = country;
    return data;
  }
}
