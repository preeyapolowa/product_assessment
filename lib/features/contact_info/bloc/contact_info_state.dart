part of 'contact_info_bloc.dart';

class ContactInfoState extends Equatable {
  final String email;
  final String name;
  final String phoneNumber;
  final String address;
  final String province;
  final String postalCode;
  final String country = "ประเทศไทย";
  final bool saveButtonEnable;
  final bool savedInfo;

  const ContactInfoState({
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.province,
    required this.postalCode,
    required this.saveButtonEnable,
    required this.savedInfo,
  });

  ContactInfoState copyWith(
      {email, name, phoneNumber, address, province, postalCode, saveButtonEnable, savedInfo}) {
    return ContactInfoState(
        email: email,
        name: name,
        phoneNumber: phoneNumber,
        address: address,
        province: province,
        postalCode: postalCode,
        saveButtonEnable: saveButtonEnable,
        savedInfo: savedInfo);
  }

  @override
  List<Object> get props =>
      [email, name, phoneNumber, address, province, postalCode, saveButtonEnable, savedInfo];
}
