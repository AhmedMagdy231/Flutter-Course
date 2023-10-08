import 'package:api_excercise/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../models/user.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  List<User> users = [];

  static AppCubit get(context)=>BlocProvider.of(context);

   void getUserData({required int size}){
     emit(GetUserLoading());
    DioHelper.getRequest(
        size: size,
    ).then((value){
       if(value.statusCode == 200 || value.statusCode == 201){
         var jsonData = value.data;
         jsonData.forEach((element){
           User u = User.fromJson(element);
           users.add(u);
         });
         emit(GetUserSuccess());
       }
       else{
         emit(GetUserError());
       }
    }).catchError((error){
      print(error.toString());
      emit(GetUserError());
    });

  }

  void changeFollowing({
    required int index,
}){
     users[index].following = !users[index].following;
     emit(ChangeFollowing());
  }



}
