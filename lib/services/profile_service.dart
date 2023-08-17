import 'dart:io';

import 'package:dio/dio.dart';
import 'package:product_assessment/services/models/response/profile_response.dart';

class ProfileService {
  final String host = Platform.isIOS ? "http://127.0.0.1:3000" : "http://10.0.2.2:3000";
  final String profileEndpoint = "/profile";
  final String contactInfoEndpoint = "/contact-info";

  Future<ProfileResponse> getProfile() async {
    final dio = Dio();
    final result = await dio.get(host + profileEndpoint);
    final object = ProfileResponse.fromJson(result.data);
    return object;
  }
}
