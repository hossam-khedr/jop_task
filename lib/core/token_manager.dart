import 'package:flutter/cupertino.dart';
import 'package:jop_task/core/networking/api_services/api_services.dart';
import 'package:jop_task/core/secure_manager.dart';

import 'app_constants.dart';

class TokenManager {
  ApiServices apiServices;

  TokenManager(this.apiServices);

  Future<String?> refreshToken() async {
    try {
      var refreshToken =
          await SecureManager.getData(key: AppConstants.refreshToken);
      final response = await apiServices.getRequest(
          endpoint: 'auth/refresh-token',
          queryParameters: {'token': refreshToken});
      final newToken = response.data['access_token'];
      // if(newToken != null){
      // //  await SecureManager.setData(
      // //       key: AppConstants.accessToken, value: newToken);
      // // }
      return newToken;
    } catch (e) {
      debugPrint('REFRESH TOKEN ERROR : ${e.toString()}');
      return e.toString();
    }
  }
}
