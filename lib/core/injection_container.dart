import 'package:get_it/get_it.dart';
import 'package:mission_app/app/presentation/state/progress_bloc/progress_bloc.dart';

GetIt sl = GetIt.instance;

void initLocator(){
  sl.registerFactory<ProgressBloc>(() => ProgressBloc());

}