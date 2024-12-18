import 'package:jop_task/core/params/login_params.dart';
import 'package:jop_task/featurs/auth/data/models/register_model.dart';

abstract class AuthDataSource{
  Future<dynamic>login(LoginParams params);
  Future<dynamic>register(RegisterModel model);
}