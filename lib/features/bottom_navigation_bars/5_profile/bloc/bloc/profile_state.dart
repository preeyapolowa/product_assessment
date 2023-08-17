part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final ProfileResponse profile;
  const ProfileState({required this.profile});

  @override
  List<Object> get props => [profile];
}
