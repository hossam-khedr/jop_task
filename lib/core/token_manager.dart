import 'package:flutter/cupertino.dart';
import 'package:jop_task/core/networking/api_services/api_services.dart';
import 'package:jop_task/core/secure_manager.dart';

import 'app_constants.dart';

class TokenManager {
  ApiServices apiServices;

  TokenManager(this.apiServices);

  Future<dynamic> refreshToken() async {
    try {
      var refreshToken =
          await SecureManager.getData(key: AppConstants.refreshToken);
      final response = await apiServices.getRequest(
          endpoint: 'auth/refresh-token',
          queryParameters: {'token': refreshToken});
       SecureManager.setData(
          key: AppConstants.accessToken, value: response.data['access_token']);
      return response;
    } catch (e) {
      debugPrint('REFRESH TOKEN ERROR : ${e.toString()}');
      return e.toString();
    }
  }
}
