import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:product_assessment/services/models/response/profile_response.dart';
import 'package:product_assessment/services/profile_service.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState(profile: ProfileResponse())) {
    on<GetProfileEvent>((event, emit) async {
      showLoading();
      final profile = await ProfileService().getProfile();
      emit(ProfileState(profile: profile));
      hideLoading();
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
}
