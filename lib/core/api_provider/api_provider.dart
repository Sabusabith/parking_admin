import 'package:dio/dio.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/route_manager.dart';
import 'package:parking_app_admin/core/apiconfigs/apiconfigs.dart';
import 'package:parking_app_admin/views/auth/login/login.dart';

import '../data/shared_pref/shared_pref.dart';

class ApiProvider {
  Dio dio = Dio();

  // ✅ Global cookie storage with a getter and setter
  static Map<String, String> _cookies = {}; // Private storage

  static Map<String, String> get cookies => _cookies; // Getter

  static set cookies(Map<String, String> value) {
    print("🚨 COOKIES RESET DETECTED! New value: $value");
    _cookies = value; // Setter with debug log
  }

  ApiProvider() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        print("🔍 Available Cookies Before Request: $cookies");
        // Attach Auth Token
        String? token = await getSavedObject('token');
        if (token != null) {
          print("latest token: $token");
          options.headers["Authorization"] = "Bearer $token";
        }

        handler.next(options);
      },
      onResponse: (response, handler) {
        _saveCookies(response);
        handler.next(response);
      },
      onError: (DioException error, handler) async {
        print(
            "❌ Dio Error: ${error.response?.statusCode}, ${error.response?.data}");

        if (error.response != null && error.response!.statusCode == 401) {
          print("🔄 Token expired, trying to refresh...");

          bool refreshed = await refreshToken();
          if (refreshed) {
            print("✅ Retrying request with new token...");
            return handler.resolve(await _retry(error.requestOptions));
          } else {
            print("🚪 Logging out user due to token refresh failure...");
            await logoutUser();
          }
        }

        handler.next(error);
      },
    ));
  }

  /// ✅ Save cookies from response headers
  void _saveCookies(Response response) {
    if (response.headers.map.containsKey('set-cookie')) {
      List<String>? setCookies = response.headers.map['set-cookie'];
      if (setCookies != null) {
        for (var cookie in setCookies) {
          var parts = cookie.split(';')[0].split('=');
          if (parts.length == 2) {
            String key = parts[0].trim();
            String value = parts[1].trim();

            print("🔄 Updating Cookie: $key = $value");

            // ✅ Update cookies through the setter
            var newCookies = Map<String, String>.from(cookies);
            newCookies[key] = value;
            cookies = newCookies;
          }
        }
      }
      print("🍪 Stored Cookies After Update: $cookies");
    }
  }

  /// 🔄 Refresh Token
  Future<bool> refreshToken() async {
    try {
      print(
          "🔄 Refreshing token via: ${AppUrls.BASE_URL + AppUrls.REFRESH_Token}");
      String cookieHeader =
          cookies.entries.map((e) => "${e.key}=${e.value}").join("; ");
    
          var cookieValue = cookieHeader.split("=")[1];

      Response response = await dio.post(
          AppUrls.BASE_URL + AppUrls.REFRESH_Token,
          options: Options(headers: {"Cookie": "refreshToken=${cookieValue.toString()}"}));

      if (response.statusCode == 200 && response.data != null) {
        print(response.statusCode);
        String? newToken = response.data['data']['token'];
        if (newToken == null) {
          print(" New Token is null");
        }
        await saveObject('token', newToken);
        print("✅ Token refreshed successfully!");
        return true;
      }
    } catch (e) {
      print("❌ Token refresh error: $e");
    }

    return false;
  }

  /// 🚪 Logout User and Clear Data
  Future<void> logoutUser() async {
    print("🚪 Logging out user...");
    cookies = {}; // ✅ Reset through setter
    Get.offAll(Login());
  }

  /// 🔄 Retry request after token refresh
  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: {"Authorization": "Bearer ${cookies['token']}"},
    );
    return dio.request(requestOptions.path, options: options);
  }

  /// 🔵 GET Request
  Future<Response<dynamic>> get(String url,
      {Map<String, dynamic>? queryParams}) async {
    try {
      print("GET request: $url");
      return await dio.get(url, queryParameters: queryParams);
    } on DioException catch (error) {
      throw handleError(error);
    }
  }

  /// 🟢 POST Request
  Future<Response<dynamic>> post(String url, dynamic data) async {
    try {
      print("POST request: $url");
      return await dio.post(url, data: data);
    } on DioException catch (error) {
      throw handleError(error);
    }
  }

  /// 🟡 PUT Request
  Future<Response<dynamic>> put(String url, dynamic data) async {
    try {
      print("PUT request: $url");
      return await dio.put(url, data: data);
    } on DioException catch (error) {
      throw handleError(error);
    }
  }

  /// 🔴 DELETE Request
  Future<Response<dynamic>> delete(String url,
      {Map<String, dynamic>? queryParams}) async {
    try {
      print("DELETE request: $url");
      return await dio.delete(url, queryParameters: queryParams);
    } on DioException catch (error) {
      throw handleError(error);
    }
  }

  /// ❌ Error Handling
  dynamic handleError(DioException error) {
    String errorDescription = "Unexpected error occurred.";

    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      errorDescription = "Connection timeout. Please try again later.";
    } else if (error.type == DioExceptionType.badResponse) {
      if (error.response != null) {
        switch (error.response!.statusCode) {
          case 400:
            errorDescription = "Bad request.";
            break;
          case 401:
            errorDescription = "Unauthorized.";
            break;
          case 404:
            errorDescription = "Resource not found.";
            break;
          case 500:
            errorDescription = "Internal server error.";
            break;
          default:
            errorDescription = "Something went wrong.";
        }
      }
    }

    print("Dio error: $errorDescription");
    return errorDescription;
  }
}
