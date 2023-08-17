class ProfileResponse {
  late String? name;
  late String? phoneNumber;
  late String? address;

  ProfileResponse({this.name, this.phoneNumber, this.address});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phone_number'];
    address = json['address'];
  }
}
