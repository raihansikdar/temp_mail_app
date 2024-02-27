import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail_app/features/auth/create_account/bloc/create_account_event.dart';
import 'package:temp_mail_app/features/auth/create_account/bloc/create_account_state.dart';
import 'package:temp_mail_app/services/network_caller.dart';
import 'package:temp_mail_app/services/network_response.dart';
import 'package:temp_mail_app/utility/urls.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent,CreateAccountState>{
  CreateAccountBloc():super(SignUpInitialState()){
    on<SignUpEvent>((event, emit) async {
     emit(SignUpLoadingState());

     Map<String, dynamic> body = {
       'address': event.address,
       'password': event.password,
     };

     NetworkResponse response = await NetworkCaller.postRequest(Urls.createAccountUrl, body);
     if(response.isSuccess){
       emit(const SignUpSuccessState(successMessage: 'Account Successfully Created'));
     }else{
       emit(const SignUpFailedState(errorMessage: 'Create Account Failed'));
     }
    });
  }
}