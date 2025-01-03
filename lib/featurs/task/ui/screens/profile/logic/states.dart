import 'package:jop_task/featurs/task/data/models/user_model.dart';
enum ProfileEnum{
  init,
  getUserInfoLoading,
  getUserInfoError,
  getUserInfoSuccess,
}
extension ProfileExtension on ProfileStates{
  get isInit => profileEnum == ProfileEnum.init;
  get isGetUserInfoLoading => profileEnum == ProfileEnum.getUserInfoLoading;
  get isGetUserInfoError => profileEnum == ProfileEnum.getUserInfoError;
  get isGetUserInfoSuccess => profileEnum == ProfileEnum.getUserInfoSuccess;
}
class ProfileStates{
 final ProfileEnum profileEnum;
final String errorMsg;
 final UserModel? model;

ProfileStates({
   this.profileEnum = ProfileEnum.init,
  this.errorMsg = '',
  this.model,
});
ProfileStates copyWith({
   ProfileEnum? profileEnum,
   String? errorMsg,
   UserModel? model,
}){
  return ProfileStates(
     errorMsg: errorMsg ?? this.errorMsg,
    model:  model ?? this.model,
    profileEnum: profileEnum ?? this.profileEnum,
  );
}
}