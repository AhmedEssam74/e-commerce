import 'package:ecommerce/features/profile/cubit/user_data_cubit/user_data_states.dart';
import 'package:ecommerce/features/profile/data/models/user_data_model/user_data_model.dart';
import 'package:ecommerce/features/profile/data/repository/user_data_repository/repo_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetUserDataCubit extends Cubit<GetUserDataStates> {
  UserDataResponse? userDataResponse;
  GetUserDataRepo repo;

  GetUserDataCubit(this.repo) : super(GetUserDataInitState());

  void getUserData ()async{
    try {
      emit(GetUserDataLoadingState());
      userDataResponse = await repo.getUserData();
      emit(GetUserDataSuccessState());
    }catch (e){
      emit(GetUserDataErrorState('$e'));
      debugPrint('$e');
    }
  }
}
