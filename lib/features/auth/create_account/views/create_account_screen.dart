import 'package:flutter/material.dart';
import 'package:temp_mail_app/common_widgets/body_header.dart';
import 'package:temp_mail_app/common_widgets/custom_appbar.dart';
import 'package:temp_mail_app/constants/app_colors.dart';
import 'package:temp_mail_app/constants/custom_size_extension.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyColors,
      appBar: const CustomAppBar(leading: true, action: false,),
      body:  Column(
        children: [
          const BodyHeader(
            headerText: 'Create Email Account',
          ),
          SizedBox(height: 16.rSp,),
          Padding(
            padding:  EdgeInsets.all(16.rSp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter Email',
                          )
                      ),
                    ),
                    SizedBox(width: 8.rSp,),
                    Text('@domain.com'),
                  ],
                ),
                SizedBox(height: 16.rSp,),
                TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Enter password',
                        suffixIcon: Icon(Icons.visibility_off,)
                    )
                ),
                SizedBox(height: 32.rSp,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.appBarColors
                      ),
                      onPressed: (){}, child: Text('Login',style: TextStyle(color: AppColors.appBarTextColor),)),
                ),
                SizedBox(height: 16.rSp,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have a account?"),
                    SizedBox(width: 8.rSp,),
                    GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold),)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


