import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/data_layer/api/user_api/login_api.dart';
import 'package:shop_app/presentation_layer/shared/constants/string_constance.dart';

import '../data_layer/repository/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  LoginCubit({required this.loginRepository}) : super(LoginInitialState());

  LoginRepository loginRepository ;
  
  void userLogin({String? email ,String? password}){



    LoginApi().postUserData(loginEndPoint, {'email':email,'password':password}).then((value) {
      print(value);
      emit(LoginSuccessState());
    }).catchError((error){
      emit(LoginErrorState(error: error));
    });
  }

  


}
