import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:temp_mail_app/common_widgets/body_header.dart';
import 'package:temp_mail_app/common_widgets/custom_appbar.dart';
import 'package:temp_mail_app/constants/app_colors.dart';
import 'package:temp_mail_app/constants/app_toast_message.dart';
import 'package:temp_mail_app/constants/custom_size_extension.dart';
import 'package:temp_mail_app/features/auth/create_account/bloc/create_account_bloc.dart';
import 'package:temp_mail_app/features/auth/create_account/bloc/create_account_event.dart';
import 'package:temp_mail_app/features/auth/create_account/bloc/create_account_state.dart';

class CreateAccountScreen extends StatefulWidget {
   CreateAccountScreen({Key? key, required this.domainName}) : super(key: key);
  final String domainName;

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _addressTEController = TextEditingController();

  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyColors,
      appBar: const CustomAppBar(leading: true, action: false,),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BodyHeader(
            headerText: 'Create Email Account',
          ),
          SizedBox(height: 16.rSp,),
          Padding(
            padding:  EdgeInsets.all(16.rSp),
            child: Form(
              key: _formKey,
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
                                  hintText: 'Enter Email',
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
                        obscureText: !_visible,
                        controller: _passwordTEController,
                          decoration: InputDecoration(
                              hintText: 'Enter password',
                              suffixIcon: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _visible = !_visible;
                                    });
                                  },
                                  child: Icon(_visible ? Icons.visibility : Icons.visibility_off ))
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
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.appBarColors
                            ),
                            onPressed: (){
                              if(!_formKey.currentState!.validate()){
                                return;
                              }else{
                                context.read<CreateAccountBloc>().add(SignUpEvent(address: _addressTEController.text.trim()+"@${widget.domainName}", password: _passwordTEController.text.trim()));
                                context.read<CreateAccountBloc>().stream.listen((state) {
                                  if(state is SignUpSuccessState){
                                    _addressTEController.clear();
                                    _passwordTEController.clear();
                                    AppToastMessage.successToast(text: state.successMessage);
                                  }else if(state is SignUpFailedState){
                                    AppToastMessage.failedToast(text: state.errorMessage);
                                  }
                                });
                              }

                            }, child: const Text('Create',style: TextStyle(color: AppColors.appBarTextColor),)),
                      ),
                      SizedBox(height: 16.rSp,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have a account?"),
                          SizedBox(width: 8.rSp,),
                          GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: const Text('Login',style: TextStyle(fontWeight: FontWeight.bold),)),
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


