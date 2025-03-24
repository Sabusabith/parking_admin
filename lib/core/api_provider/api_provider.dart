import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:parking_app_admin/core/apiconfigs/apiconfigs.dart';
import 'package:parking_app_admin/core/models/auth/refresh_token_model.dart';
import 'package:parking_app_admin/views/auth/login/login.dart';
import '../data/shared_pref/shared_pref.dart';

class ApiProvider {
  Dio dio = Dio();
  RefreshTokebnModel? refreshTokebnModel;
  ApiProvider() {
    dio = Dio();

    // Add interceptor to handle 401 Unauthorized errors globally
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Fetch latest token before making request
        String? token = await getSavedObject('token');
        if (token != null) {
          print("latest token: $token");
          options.headers["Authorization"] = "Bearer $token";
        }
        handler.next(options);
      },
      onError: (DioException error, ErrorInterceptorHandler handler) async {
        if (error.response != null && error.response!.statusCode == 401) {
          print("🔄 Token expired, trying to refresh...");

          // Try refreshing the token
          bool refreshed = await refreshToken();

          if (refreshed) {
            // Retry the failed request with the new token
            return handler.resolve(await _retry(error.requestOptions));
          } else {
            // If refresh token is also expired, logout the user
            await logoutUser();
          }
        }
        handler.next(error); // Continue processing the error
      },
    ));
  }

  /// Refresh Token Function
  Future<bool> refreshToken() async {
    try {
      // String? refreshToken = await getSavedObject('refreshToken');
      // if (refreshToken == null) return false; // No refresh token, force logout

      Response response = await dio.post(
        AppUrls.BASE_URL + AppUrls.REFRESH_Token,
        // data: {'refresh_token': refreshToken},
      );

      if (response.statusCode == 200) {
        refreshTokebnModel = refreshTokebnModelFromJson(response.data);
        print(" refresh token status code ${response.statusCode}");
        String? newToken = refreshTokebnModel?.data.token.toString();
        //
        //print(newToken);
        if (newToken == null) {
          print(" New Token is null");
        }
        await saveObject('token', newToken);
        print("✅ Token refreshed successfully!");
        return true;
      }
    } catch (e) {
      print("❌ Token refresh failed: $e");
    }
    return false;
  }

  /// Logout User and Clear Data
  Future<void> logoutUser() async {
    print("🚪 Logging out user...");

    await clearSavedObject('token');
    await clearSavedObject('refreshToken');

    // Navigate to login screen (replace with your login page)
    Get.offAll(Login());
  }

  /// Retry request after token refresh
  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    String? newToken = await getSavedObject('token');
    final options = Options(
      method: requestOptions.method,
      headers: {"Authorization": "Bearer $newToken"},
    );
    return dio.request(requestOptions.path, options: options);
  }

  /// GET Request
  Future<Response<dynamic>> get(String url,
      {Map<String, dynamic>? queryParams}) async {
    try {
      print("GET request: $url");
      return await dio.get(url, queryParameters: queryParams);
    } on DioException catch (error) {
      throw handleError(error);
    }
  }

  /// POST Request
  Future<Response<dynamic>> post(String url, dynamic data) async {
    try {
      print("POST request: $url");
      return await dio.post(url, data: data);
    } on DioException catch (error) {
      throw handleError(error);
    }
  }

  /// PUT Request
  Future<Response<dynamic>> put(String url, dynamic data) async {
    try {
      print("PUT request: $url");
      return await dio.put(url, data: data);
    } on DioException catch (error) {
      throw handleError(error);
    }
  }

  /// Error Handling
  dynamic handleError(DioException error) {
    String errorDescription = "";

    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      errorDescription = "Connection timeout. Please try again later.";
    } else if (error.type == DioExceptionType.badResponse) {
      if (error.response != null) {
        switch (error.response!.statusCode) {
          case 400:
            errorDescription = "Bad request. Please check your input.";
            break;
          case 401:
            errorDescription = "Unauthorized. Please log in again.";
            break;
          case 403:
            errorDescription = "Forbidden. You don't have permission.";
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
    } else if (error.type == DioExceptionType.cancel) {
      errorDescription = "Request was cancelled.";
    } else {
      errorDescription = "Unexpected error occurred.";
    }

    print("Dio error: $errorDescription");
    return errorDescription;
  }
}
