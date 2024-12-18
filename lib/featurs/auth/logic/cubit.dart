import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_task/core/params/login_params.dart';
import 'package:jop_task/featurs/auth/data/models/register_model.dart';
import 'package:jop_task/featurs/auth/data/repo.dart';
import 'package:jop_task/featurs/auth/logic/states.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthRepo authRepo;

  AuthCubit({required this.authRepo}) : super(AuthStates());
void passwordShow(bool value){
  value = !value;
  emit(state.copyWith(authStatus: AuthStatus.isPasswordShoe,obscureText: value));
}
void updateLevelValue(String? value){
  state.experienceLevel = value!;
  emit(state.copyWith(authStatus: AuthStatus.updateLevel,experienceLevel: value));
}
  Future<void> login(LoginParams params) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    (await authRepo.login(params)).fold(
      (error) => emit(
          state.copyWith(authStatus: AuthStatus.error, errorMessage: error)),
      (success) => emit(
        state.copyWith(authStatus: AuthStatus.success),
      ),
    );
  }
  Future<void> register(RegisterModel model) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    (await authRepo.register(model)).fold(
      (error) => emit(
          state.copyWith(authStatus: AuthStatus.error, errorMessage: error)),
      (success) => emit(
        state.copyWith(authStatus: AuthStatus.success),
      ),
    );
  }
}
