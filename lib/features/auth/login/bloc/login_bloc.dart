import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail_app/features/auth/login/bloc/login_event.dart';
import 'package:temp_mail_app/features/auth/login/bloc/login_state.dart';
import 'package:temp_mail_app/services/network_caller.dart';
import 'package:temp_mail_app/services/network_response.dart';
import 'package:temp_mail_app/utility/auth_utility.dart';
import 'package:temp_mail_app/utility/urls.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc():super(UserLoginInitialState()){
    on<UserLoginEvent>((event, emit) async {
      emit(UserLoginLoadingState());

      Map<String, dynamic> body = {
        'address': event.address,
        'password': event.password,
      };

      NetworkResponse response = await NetworkCaller.postRequest(Urls.tokenUrl, body);
      if(response.isSuccess){
        await AuthUtility.setAccessToken(token: response.body['token']);
        emit(const UserLoginSuccessState(successMessage: 'Login successful.'));
      }else{
        emit(const UserLoginFailedState(errorMessage: 'Login Failed.'));
      }
    });
  }
}