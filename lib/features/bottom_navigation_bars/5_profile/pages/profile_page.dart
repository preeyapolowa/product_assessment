import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_assessment/features/bottom_navigation_bars/5_profile/bloc/bloc/profile_bloc.dart';
import 'package:product_assessment/features/routes.dart';
import 'package:product_assessment/utils/utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  final String nameTitle = "Name";
  final String remarkTitle = "Can’t make any change in 90 days";
  final String myAddressTitle = "My address";

  final String namePlaceholder = "Name";
  final String phoneNumberPlaceholder = "Phone number (+66)";
  final String addressPlaceholder = "Address";

  final String editButtonTitle = "Edit";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileBloc>(context).add(GetProfileEvent());

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final String name = state.profile.name ?? "";
        final String phoneNumber = state.profile.phoneNumber ?? "";
        final String address = state.profile.address ?? "";

        return SafeArea(
          minimum: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.only(top: 64),
            child: SizedBox(
              height: 260,
              child: Row(
                children: [
                  Expanded(
                    // Left
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          // Name
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.nameTitle,
                              style: const TextStyle(
                                  fontSize: 14, fontFamily: 'Graphik', fontWeight: FontWeight.w500),
                            ),
                            Text(
                              widget.remarkTitle,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Graphik',
                                  fontWeight: FontWeight.normal),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: colorFromHex("#F7F8F8")),
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      name.isEmpty ? widget.namePlaceholder : name,
                                      style: TextStyle(
                                          color: name.isEmpty ? Colors.grey : Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Graphik',
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          // My Address
                          padding: const EdgeInsets.only(top: 8),
                          child: Column(
                            // Name
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                widget.myAddressTitle,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Graphik',
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: colorFromHex("#F7F8F8")),
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      phoneNumber.isEmpty
                                          ? widget.phoneNumberPlaceholder
                                          : phoneNumber,
                                      style: TextStyle(
                                          color: phoneNumber.isEmpty ? Colors.grey : Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Graphik',
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: colorFromHex("#F7F8F8")),
                                height: 98,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      address.isEmpty ? widget.addressPlaceholder : address,
                                      style: TextStyle(
                                          color: address.isEmpty ? Colors.grey : Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Graphik',
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    // Right
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          Images.profilePlaceholder,
                          width: 60,
                          height: 60,
                        ),
                        ElevatedButton(
                          onPressed: () => {
                            Navigator.pushNamed(context, AppRoute.contactInfoPage),
                          },
                          style: ButtonStyle(
                            shadowColor: MaterialStateProperty.all(Colors.transparent),
                            backgroundColor: MaterialStateProperty.all(colorFromHex("#F05349")),
                            minimumSize: MaterialStateProperty.all(
                                const Size(72, 24)), // Adjust the height as needed
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(horizontal: 8)),
                          ),
                          child: Text(
                            widget.editButtonTitle,
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
