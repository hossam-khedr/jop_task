import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_task/featurs/task/data/repo.dart';
import 'package:jop_task/featurs/task/ui/screens/profile/logic/states.dart';

class ProfileCubit extends Cubit<ProfileStates>{
 final TaskRepo taskRepo;
 ProfileCubit({required this.taskRepo}):super(ProfileStates());


 Future<void> getUserInfo() async {
   if (!isClosed) {
     emit(state.copyWith(profileEnum: ProfileEnum.getUserInfoLoading));
   }
   (await taskRepo.getUserInfo()).fold((error) {
     if (!isClosed) {
       emit(state.copyWith(
           profileEnum: ProfileEnum.getUserInfoError, errorMsg: error));
     }
   }, (data) {
     if (!isClosed) {
       emit(
         state.copyWith(
             profileEnum: ProfileEnum.getUserInfoSuccess, model: data),
       );
     }
   });
 }
}