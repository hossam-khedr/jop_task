import 'package:jop_task/core/networking/api_services/api_services.dart';
import 'package:jop_task/core/params/login_params.dart';
import 'package:jop_task/featurs/auth/data/data_source.dart';
import 'package:jop_task/featurs/auth/data/models/register_model.dart';

class AuthRemoteDataSource implements AuthDataSource {
  ApiServices apiServices;

  AuthRemoteDataSource({required this.apiServices});

  @override
  Future<dynamic> login(LoginParams params) async {
    final response = apiServices.postRequest(
      endpoint: 'auth/login',
      data: {'phone': params.phoneNumber, 'password': params.password},
    );
    return response;
  }

  @override
  Future<dynamic> register(RegisterModel model) async {
    final response = await apiServices.postRequest(
      endpoint: 'auth/register',
      data: model.toJson(),
    );
    return response;
  }
}
