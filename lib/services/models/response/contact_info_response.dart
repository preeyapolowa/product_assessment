class ContactInfoResponse {
  late String? email;
  late String? name;
  late String? phoneNumber;
  late String? address;
  late String? province;
  late String? postalCode;
  late String? country;

  ContactInfoResponse(
      {this.email,
      this.name,
      this.phoneNumber,
      this.address,
      this.province,
      this.postalCode,
      this.country});

  ContactInfoResponse.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    province = json['province'];
    if (json['postal_code'].toString() != "null") {
      postalCode = json['postal_code'].toString();
    } else {
      postalCode = null;
    }
    country = json['country'];
  }
}

class SaveContactInfoResponse {
  late String status;
  late String message;

  SaveContactInfoResponse({
    required this.status,
    required this.message,
  });

  SaveContactInfoResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
