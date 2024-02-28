import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail_app/common_bloc/password_visibility_bloc.dart';
import 'package:temp_mail_app/common_bloc/password_visibility_event.dart';
import 'package:temp_mail_app/common_widgets/body_header.dart';
import 'package:temp_mail_app/common_widgets/circular_inside_button_widget.dart';
import 'package:temp_mail_app/common_widgets/custom_appbar.dart';
import 'package:temp_mail_app/constants/app_colors.dart';
import 'package:temp_mail_app/constants/app_toast_message.dart';
import 'package:temp_mail_app/constants/custom_size_extension.dart';
import 'package:temp_mail_app/features/auth/create_account/views/create_account_screen.dart';
import 'package:temp_mail_app/features/auth/login/bloc/login_bloc.dart';
import 'package:temp_mail_app/features/auth/login/bloc/login_event.dart';
import 'package:temp_mail_app/features/auth/login/bloc/login_state.dart';
import 'package:temp_mail_app/features/home/views/home_screen.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key, required this.domainName}) : super(key: key);
  final String domainName;

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _addressTEController = TextEditingController();

  final TextEditingController _passwordTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('================rebuild==============');
    return Scaffold(
      backgroundColor: AppColors.bodyColors,
      appBar: const CustomAppBar(leading: true, action: false,),
      body:  Column(
        children: [
          const BodyHeader(
            headerText: 'Login',
          ),
          SizedBox(height: 16.rSp,),
          Padding(
            padding:  EdgeInsets.all(16.rSp),
            child: Form(
              key: LoginScreen._formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _addressTEController,
                          decoration: const InputDecoration(
                            hintText: 'Enter Address',
                          ),
                          validator: (String? value){
                            if(value?.isEmpty ?? true){
                              return 'This field is mandatory';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 8.rSp,),
                      Text("@${widget.domainName}",style: TextStyle(fontSize: 24.rSp,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  SizedBox(height: 16.rSp,),
                  TextFormField(
                    obscureText: ! context.watch<PasswordVisibilityBloc>().visible,
                    controller: _passwordTEController,
                    decoration: InputDecoration(
                        hintText: 'Enter password',
                        suffixIcon: GestureDetector(
                            onTap: (){
                              context.read<PasswordVisibilityBloc>().add(PasswordVisibilityChangeEvent());
                            },
                            child: Icon(context.watch<PasswordVisibilityBloc>().visible ? Icons.visibility : Icons.visibility_off ))
                    ),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return 'This field is mandatory';
                      }else if(value!.length  < 5 ){
                        return 'Password must be greater than 4 digit';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 32.rSp,),
                  SizedBox(
                    width: double.infinity,
                    child: BlocBuilder<LoginBloc,LoginState>(
                      builder: (context,_loginState) {
                        return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.appBarColors
                            ),
                            onPressed: (){
                              if(!LoginScreen._formKey.currentState!.validate()){
                                return;
                              }
                              else{
                                String name = _addressTEController.text.trim()+"@${widget.domainName}";
                                context.read<LoginBloc>().add(UserLoginEvent(address: _addressTEController.text.trim()+"@${widget.domainName}", password: _passwordTEController.text.trim()));
                                // context.read<LoginBloc>().stream.listen((state) {
                                //   if(state is UserLoginSuccessState){
                                //     _addressTEController.clear();
                                //     _passwordTEController.clear();
                                //     AppToastMessage.successToast(text: state.successMessage);
                                //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const HomeScreen()), (route) => false);
                                //   }else if(state is UserLoginFailedState){
                                //     AppToastMessage.failedToast(text: state.errorMessage);
                                //   }
                                // });
                                if(_loginState is UserLoginSuccessState){
                                      _addressTEController.clear();
                                      _passwordTEController.clear();
                                      AppToastMessage.successToast(text: _loginState.successMessage);
                                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const HomeScreen()), (route) => false);
                                    }else if(_loginState is UserLoginFailedState){
                                      AppToastMessage.failedToast(text: _loginState.errorMessage);
                                    }
                                }

                            }, child: _loginState is UserLoginLoadingState ? CircularInsideButtonWidget() :
                                const Text('Login',style: TextStyle(color: AppColors.appBarTextColor),),

                        );
                      }
                    ),
                  ),
                  SizedBox(height: 16.rSp,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Can't have a account?"),
                      SizedBox(width: 8.rSp,),
                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateAccountScreen(domainName: widget.domainName)));
                            _addressTEController.clear();
                            _passwordTEController.clear();
                          },
                          child: const Text('Create',style: TextStyle(fontWeight: FontWeight.bold),)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


