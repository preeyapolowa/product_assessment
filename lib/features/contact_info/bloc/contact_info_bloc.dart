import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:product_assessment/services/contact_info_service.dart';
import 'package:product_assessment/services/models/request/contact_info_request.dart';
import 'package:product_assessment/services/models/response/contact_info_response.dart';

part 'contact_info_event.dart';
part 'contact_info_state.dart';

class ContactInfoBloc extends Bloc<ContactInfoEvent, ContactInfoState> {
  String email = "";
  String name = "";
  String phoneNumber = "";
  String address = "";
  String province = "";
  String postalCode = "";

  ContactInfoBloc()
      : super(const ContactInfoState(
          email: "",
          name: "",
          phoneNumber: "",
          address: "",
          province: "",
          postalCode: "",
          saveButtonEnable: false,
          savedInfo: false,
        )) {
    listenGetContactInfoEvent();
    listenOnValueEmailChangedEvent();
    listenOnValueNameChangedEvent();
    listenOnValuePhoneNumberChangedEvent();
    listenOnValueAddressChangedEvent();
    listenOnValueProvinceChangedEvent();
    listenOnValuePostalCodeChangedEvent();
    listenOnSaveButtonTappedEvent();
    listenOnNavigatorPopEvent();
  }

  void listenGetContactInfoEvent() {
    on<GetContactInfoEvent>((event, emit) async {
      showLoading();
      final contactInfo = await ContactInfoService().getContactInfo();
      updateValue(contactInfo);
      emit(state.copyWith(
          email: contactInfo.email ?? "",
          name: contactInfo.name ?? "",
          phoneNumber: contactInfo.phoneNumber ?? "",
          address: contactInfo.address ?? "",
          province: contactInfo.province ?? "",
          postalCode: contactInfo.postalCode ?? "",
          saveButtonEnable: isSaveButtonEnabled(),
          savedInfo: false));
      hideLoading();
    });
  }

  void listenOnValueEmailChangedEvent() {
    on<OnValueEmailChangedEvent>((event, emit) async {
      email = event.email;
      emit(state.copyWith(
          email: event.email,
          name: state.name,
          phoneNumber: state.phoneNumber,
          address: state.address,
          province: state.province,
          postalCode: state.postalCode,
          saveButtonEnable: isSaveButtonEnabled(),
          savedInfo: false));
    });
  }

  void listenOnValueNameChangedEvent() {
    on<OnValueNameChangedEvent>((event, emit) async {
      name = event.name;
      emit(state.copyWith(
          email: state.email,
          name: event.name,
          phoneNumber: state.phoneNumber,
          address: state.address,
          province: state.province,
          postalCode: state.postalCode,
          saveButtonEnable: isSaveButtonEnabled(),
          savedInfo: false));
    });
  }

  void listenOnValuePhoneNumberChangedEvent() {
    on<OnValuePhoneNumberChangedEvent>((event, emit) async {
      phoneNumber = event.phoneNumber;
      emit(state.copyWith(
          email: state.email,
          name: state.name,
          phoneNumber: event.phoneNumber,
          address: state.address,
          province: state.province,
          postalCode: state.postalCode,
          saveButtonEnable: isSaveButtonEnabled(),
          savedInfo: false));
    });
  }

  void listenOnValueAddressChangedEvent() {
    on<OnValueAddressChangedEvent>((event, emit) async {
      address = event.address;
      emit(state.copyWith(
          email: state.email,
          name: state.name,
          phoneNumber: state.phoneNumber,
          address: event.address,
          province: state.province,
          postalCode: state.postalCode,
          saveButtonEnable: isSaveButtonEnabled(),
          savedInfo: false));
    });
  }

  void listenOnValueProvinceChangedEvent() {
    on<OnValueProvinceChangedEvent>((event, emit) async {
      province = event.province;
      emit(state.copyWith(
          email: state.email,
          name: state.name,
          phoneNumber: state.phoneNumber,
          address: state.address,
          province: event.province,
          postalCode: state.postalCode,
          saveButtonEnable: isSaveButtonEnabled(),
          savedInfo: false));
    });
  }

  void listenOnValuePostalCodeChangedEvent() {
    on<OnValuePostalCodeChangedEvent>((event, emit) async {
      postalCode = event.postalCode;
      emit(state.copyWith(
          email: state.email,
          name: state.name,
          phoneNumber: state.phoneNumber,
          address: state.address,
          province: state.province,
          postalCode: event.postalCode,
          saveButtonEnable: isSaveButtonEnabled(),
          savedInfo: false));
    });
  }

  void listenOnSaveButtonTappedEvent() {
    on<OnSaveButtonTappedEvent>((event, emit) async {
      showLoading();
      final request = ContactInfoRequest(
          email: email,
          name: name,
          phoneNumber: phoneNumber,
          address: address,
          province: province,
          postalCode: postalCode,
          country: state.country);

      final saveContactInfo = await ContactInfoService().saveContactInfo(request);
      debugPrint("$saveContactInfo");

      hideLoading();
      emit(state.copyWith(
          email: state.email,
          name: state.name,
          phoneNumber: state.phoneNumber,
          address: state.address,
          province: state.province,
          postalCode: state.postalCode,
          saveButtonEnable: isSaveButtonEnabled(),
          savedInfo: true));
    });
  }

  void listenOnNavigatorPopEvent() {
    on<OnNavigatorPopEvent>((event, emit) async {
      emit(state.copyWith(
          email: "",
          name: "",
          phoneNumber: "",
          address: "",
          province: "",
          postalCode: "",
          saveButtonEnable: false,
          savedInfo: false));
    });
  }

  void showLoading() {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.show();
  }

  void hideLoading() {
    EasyLoading.instance.userInteractions = true;
    EasyLoading.dismiss();
  }

  void updateValue(ContactInfoResponse contactInfo) {
    email = contactInfo.email ?? "";
    name = contactInfo.name ?? "";
    phoneNumber = contactInfo.phoneNumber ?? "";
    address = contactInfo.address ?? "";
    province = contactInfo.province ?? "";
    postalCode = contactInfo.postalCode ?? "";
  }

  bool isSaveButtonEnabled() {
    return email.isNotEmpty &&
        name.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        address.isNotEmpty &&
        province.isNotEmpty &&
        postalCode.isNotEmpty;
  }
}
