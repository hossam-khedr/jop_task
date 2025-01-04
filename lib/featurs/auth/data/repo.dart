import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:jop_task/core/app_constants.dart';
import 'package:jop_task/core/params/login_params.dart';
import 'package:jop_task/core/secure_manager.dart';
import 'package:jop_task/featurs/auth/data/data_source.dart';
import 'package:jop_task/featurs/auth/data/models/register_model.dart';

class AuthRepo {
  final AuthDataSource authDataSource;

  AuthRepo({required this.authDataSource});

  Future<Either<String, void>> login(LoginParams params) async {
    try {
      final response = await authDataSource.login(params);
      String accessToken = response.data['access_token'];
      String refreshToken = response.data['refresh_token'];
      SecureManager.setData(
          key: AppConstants.accessToken, value: accessToken);
      SecureManager.setData(
          key: AppConstants.refreshToken, value: refreshToken);
      debugPrint("ACCESS TOKEN ;$accessToken");
      debugPrint("REFRESH TOKEN ;$refreshToken");
      return const Right(null);
    } catch (e) {
      debugPrint('LOGIN ERROR : ${e.toString()}');
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> register(RegisterModel model) async {
    try {
      await authDataSource.register(model);
      return const Right(null);
    } catch (e) {
      debugPrint('REGISTER ERROR : ${e.toString()}');
      return Left(e.toString());
    }
  }
}
