class User {
  constructor(
    name,
    email,
    phone_number,
    address,
    province,
    postal_code,
    country
  ) {
    this.name = name;
    this.email = email;
    this.phone_number = phone_number;
    this.address = address;
    this.province = province;
    this.postal_code = postal_code;
    this.country = country;
  }
}

function GenericResponse(status, message) {
  return {
    status: status,
    message: message,
  };
}

function ProfileResponse(name, phone_number, address) {
  return {
    name: name,
    phone_number: phone_number,
    address: address,
  };
}

function ContactInfoResponse(
  name,
  email,
  phone_number,
  address,
  province,
  postal_code,
  country
) {
  return {
    name: name,
    email: email,
    phone_number: phone_number,
    address: address,
    province: province,
    postal_code: postal_code,
    country: country,
  };
}

module.exports = {
  User,
  GenericResponse,
  ProfileResponse,
  ContactInfoResponse,
};
