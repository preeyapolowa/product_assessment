import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_assessment/features/bottom_navigation_bars/5_profile/bloc/bloc/profile_bloc.dart';
import 'package:product_assessment/features/contact_info/bloc/contact_info_bloc.dart';
import 'package:product_assessment/utils/utils.dart';

class ContactInfoPage extends StatefulWidget {
  const ContactInfoPage({super.key});

  final String contactInfoTitle = "Contact information";
  final String emailTitle = "Email";

  final String deliveryAddressTitle = "Delivery address";
  final String nameTitle = "Name";
  final String phoneNoTtitle = "Phone no.";
  final String addressTitle = "Address";
  final String provinceTitle = "Province";
  final String postalCodeTitle = "Postal code";
  final String countryTitle = "Country";
  final String saveButtonTitle = "Save";

  final String alertTitle = "สำเร็จ";
  final String alertDescription = "บันทึกข้อมูลสำเร็จ";
  final String alertButtonTitle = "เข้าใจแล้ว";
  @override
  State<ContactInfoPage> createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  TextEditingController textEmailController = TextEditingController();
  TextEditingController textNameController = TextEditingController();
  TextEditingController textPhoneNumberController = TextEditingController();
  TextEditingController textAddressController = TextEditingController();
  TextEditingController textProvinceController = TextEditingController();
  TextEditingController textPostalCodeController = TextEditingController();

  void setText(ContactInfoState state) {
    textEmailController.text = state.email;
    textEmailController.selection =
        TextSelection.fromPosition(TextPosition(offset: textEmailController.text.length));

    textNameController.text = state.name;
    textNameController.selection =
        TextSelection.fromPosition(TextPosition(offset: textNameController.text.length));

    textPhoneNumberController.text = state.phoneNumber;
    textPhoneNumberController.selection =
        TextSelection.fromPosition(TextPosition(offset: textPhoneNumberController.text.length));

    textAddressController.text = state.address;
    textAddressController.selection =
        TextSelection.fromPosition(TextPosition(offset: textAddressController.text.length));

    textProvinceController.text = state.province;
    textProvinceController.selection =
        TextSelection.fromPosition(TextPosition(offset: textProvinceController.text.length));

    textPostalCodeController.text = state.postalCode;
    textPostalCodeController.selection =
        TextSelection.fromPosition(TextPosition(offset: textPostalCodeController.text.length));
  }

  Future<void> showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            widget.alertTitle,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(widget.alertDescription),
          actions: <Widget>[
            TextButton(
              child: Text(widget.alertButtonTitle),
              onPressed: () {
                BlocProvider.of<ContactInfoBloc>(context).add(OnNavigatorPopEvent());
                BlocProvider.of<ProfileBloc>(context).add(GetProfileEvent());
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showAlert(ContactInfoState state) async {
    debugPrint("${state.savedInfo}");
    if (state.savedInfo) {
      WidgetsBinding.instance.addPostFrameCallback((_) => showAlertDialog());
    }
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ContactInfoBloc>(context).add(GetContactInfoEvent());

    return BlocBuilder<ContactInfoBloc, ContactInfoState>(
      builder: (context, state) {
        setText(state);
        showAlert(state);

        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            appBar: AppBar(
                scrolledUnderElevation: 0,
                title: const Text(""),
                leading: GestureDetector(
                  child: const Icon(Icons.arrow_back),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )),
            body: ListView(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // Contact Info
                      widget.contactInfoTitle,
                      style: const TextStyle(
                          fontSize: 20, fontFamily: 'Graphik', fontWeight: FontWeight.w600),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            widget.emailTitle,
                            style: const TextStyle(
                                fontSize: 14, fontFamily: 'Graphik', fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: colorFromHex("#F7F8F8")),
                            height: 56,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextField(
                                    controller: textEmailController,
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: ((value) => {
                                          BlocProvider.of<ContactInfoBloc>(context)
                                              .add(OnValueEmailChangedEvent(email: value))
                                        }),
                                    decoration: const InputDecoration(border: InputBorder.none)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.contactInfoTitle,
                      style: const TextStyle(
                          fontSize: 20, fontFamily: 'Graphik', fontWeight: FontWeight.w600),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            widget.nameTitle,
                            style: const TextStyle(
                                fontSize: 14, fontFamily: 'Graphik', fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: colorFromHex("#F7F8F8")),
                            height: 56,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextField(
                                    controller: textNameController,
                                    onChanged: ((value) => {
                                          BlocProvider.of<ContactInfoBloc>(context)
                                              .add(OnValueNameChangedEvent(name: value))
                                        }),
                                    decoration: const InputDecoration(border: InputBorder.none)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            widget.phoneNoTtitle,
                            style: const TextStyle(
                                fontSize: 14, fontFamily: 'Graphik', fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: colorFromHex("#F7F8F8")),
                            height: 56,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextField(
                                    controller: textPhoneNumberController,
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(10)
                                    ],
                                    onChanged: ((value) => {
                                          BlocProvider.of<ContactInfoBloc>(context).add(
                                              OnValuePhoneNumberChangedEvent(phoneNumber: value))
                                        }),
                                    decoration: const InputDecoration(border: InputBorder.none)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            widget.addressTitle,
                            style: const TextStyle(
                                fontSize: 14, fontFamily: 'Graphik', fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: colorFromHex("#F7F8F8")),
                            height: 56,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextField(
                                    controller: textAddressController,
                                    keyboardType: TextInputType.streetAddress,
                                    onChanged: ((value) => {
                                          BlocProvider.of<ContactInfoBloc>(context)
                                              .add(OnValueAddressChangedEvent(address: value))
                                        }),
                                    decoration: const InputDecoration(border: InputBorder.none)),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    widget.provinceTitle,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Graphik',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: colorFromHex("#F7F8F8")),
                                  height: 56,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: TextField(
                                          controller: textProvinceController,
                                          onChanged: ((value) => {
                                                BlocProvider.of<ContactInfoBloc>(context).add(
                                                    OnValueProvinceChangedEvent(province: value))
                                              }),
                                          decoration:
                                              const InputDecoration(border: InputBorder.none)),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            const SizedBox(width: 20),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    widget.postalCodeTitle,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Graphik',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: colorFromHex("#F7F8F8")),
                                  height: 56,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: TextField(
                                          textInputAction: TextInputAction.done,
                                          controller: textPostalCodeController,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.digitsOnly,
                                            LengthLimitingTextInputFormatter(5)
                                          ],
                                          onChanged: ((value) => {
                                                BlocProvider.of<ContactInfoBloc>(context).add(
                                                    OnValuePostalCodeChangedEvent(
                                                        postalCode: value))
                                              }),
                                          decoration:
                                              const InputDecoration(border: InputBorder.none)),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        widget.countryTitle,
                        style: const TextStyle(
                            fontSize: 14, fontFamily: 'Graphik', fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colorFromHex("#F7F8F8")),
                        height: 56,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              state.country,
                              style: const TextStyle(
                                  fontSize: 14, fontFamily: 'Graphik', fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            bottomNavigationBar: SafeArea(
              minimum: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: state.saveButtonEnable
                    ? () => {
                          BlocProvider.of<ContactInfoBloc>(context).add(OnSaveButtonTappedEvent()),
                        }
                    : null,
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  backgroundColor: MaterialStateProperty.all(
                      state.saveButtonEnable ? Colors.blueAccent : colorFromHex("#A6E4FF")),
                  minimumSize:
                      MaterialStateProperty.all(const Size(0, 56)), // Adjust the height as needed
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 8)),
                ),
                child: Text(
                  widget.saveButtonTitle,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
