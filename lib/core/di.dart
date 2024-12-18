import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jop_task/core/networking/api_services/api_services.dart';
import 'package:jop_task/featurs/auth/data/data_source.dart';
import 'package:jop_task/featurs/auth/data/remote/remote_data_source.dart';
import 'package:jop_task/featurs/auth/data/repo.dart';
import 'package:jop_task/featurs/auth/logic/cubit.dart';
import 'package:jop_task/featurs/task/data/data_source.dart';
import 'package:jop_task/featurs/task/data/remote/remote_data_source.dart';
import 'package:jop_task/featurs/task/data/repo.dart';
import 'package:jop_task/featurs/task/logic/cubit.dart';

import 'networking/api_services/api_services_impl.dart';

final sl = GetIt.instance;
Future<void>initDI()async{
  Dio dio = Dio();
  sl.registerLazySingleton<ApiServices>(()=>AipServicesImplWithDio(dio: dio));
}

Future<void>initAuthModule()async{
  sl.registerFactory<AuthDataSource>(()=>AuthRemoteDataSource(apiServices: sl()));
  sl.registerFactory<AuthRepo>(()=>AuthRepo(authDataSource: sl()));
  sl.registerFactory<AuthCubit>(()=>AuthCubit(authRepo: sl()));
}

Future<void>initTaskModule()async{
  sl.registerLazySingleton<TaskDatasource>(()=>TaskDataSourceImpl(apiServices: sl()));
  sl.registerLazySingleton<TaskRepo>(()=>TaskRepo(taskDatasource: sl()));
  sl.registerLazySingleton<TaskCubit>(()=>TaskCubit(taskRepo: sl()));
}