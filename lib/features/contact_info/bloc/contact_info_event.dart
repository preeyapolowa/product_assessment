part of 'contact_info_bloc.dart';

sealed class ContactInfoEvent extends Equatable {
  const ContactInfoEvent();

  @override
  List<Object> get props => [];
}

class GetContactInfoEvent extends ContactInfoEvent {}

class OnValueEmailChangedEvent extends ContactInfoEvent {
  final String email;

  const OnValueEmailChangedEvent({required this.email});
}

class OnValueNameChangedEvent extends ContactInfoEvent {
  final String name;

  const OnValueNameChangedEvent({required this.name});
}

class OnValuePhoneNumberChangedEvent extends ContactInfoEvent {
  final String phoneNumber;

  const OnValuePhoneNumberChangedEvent({required this.phoneNumber});
}

class OnValueAddressChangedEvent extends ContactInfoEvent {
  final String address;

  const OnValueAddressChangedEvent({required this.address});
}

class OnValueProvinceChangedEvent extends ContactInfoEvent {
  final String province;

  const OnValueProvinceChangedEvent({required this.province});
}

class OnValuePostalCodeChangedEvent extends ContactInfoEvent {
  final String postalCode;

  const OnValuePostalCodeChangedEvent({required this.postalCode});
}

class OnSaveButtonTappedEvent extends ContactInfoEvent {}

class OnNavigatorPopEvent extends ContactInfoEvent {}
