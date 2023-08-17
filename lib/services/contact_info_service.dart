import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:product_assessment/services/models/request/contact_info_request.dart';
import 'package:product_assessment/services/models/response/contact_info_response.dart';

class ContactInfoService {
  final String host = Platform.isIOS ? "http://127.0.0.1:3000" : "http://10.0.2.2:3000";
  final String contactInfoEndpoint = "/contact-info";

  Future<ContactInfoResponse> getContactInfo() async {
    final dio = Dio();
    final result = await dio.get(host + contactInfoEndpoint);
    final object = ContactInfoResponse.fromJson(result.data);
    return object;
  }

  Future<SaveContactInfoResponse> saveContactInfo(ContactInfoRequest request) async {
    final dio = Dio();
    final result = await dio.post(
      host + contactInfoEndpoint,
      options: Options(headers: {HttpHeaders.contentTypeHeader: "application/json"}),
      data: jsonEncode(request.toJson()),
    );
    final object = SaveContactInfoResponse.fromJson(result.data);
    return object;
  }
}
