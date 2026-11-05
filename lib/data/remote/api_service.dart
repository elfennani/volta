import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:volta/domain/exceptions/auth_exception.dart';

class ApiService {
  late final Dio dio;

  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://10.235.47.37:3000",
        headers: {"Content-Type": "application/json"},
        receiveDataWhenStatusError: true,
      ),
    );

    dio.interceptors.add(LogInterceptor(responseBody: kDebugMode, requestBody: kDebugMode));
  }

  Future<void> requestCode(String phone) async {
    try {
      final res = await dio.post("/auth/code", data: {"phone": phone});
    } on DioException catch (e) {
      if (kDebugMode) {
        print("[API_SERVICE_EXCEPTION] Input: $phone; Error: $e");
      }

      final message = e.response?.data["message"] as String?;
      final statusCode = e.response?.statusCode;

      if (message != null && statusCode == 400) {
        throw AuthException(.invalidPhoneNumber, message);
      }

      throw AuthException(.unknown, message ?? "Something went wrong");
    }
  }
}

final apiServiceProvider = Provider.autoDispose<ApiService>((ref) {
  return ApiService();
});
