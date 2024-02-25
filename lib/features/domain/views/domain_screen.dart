import 'package:flutter/material.dart';
import 'package:temp_mail_app/common_widgets/body_header.dart';
import 'package:temp_mail_app/common_widgets/custom_appbar.dart';
import 'package:temp_mail_app/constants/app_colors.dart';
import 'package:temp_mail_app/constants/custom_size_extension.dart';

class DomainScreen extends StatelessWidget {
  const DomainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyColors,
      appBar: CustomAppBar(),
      body:  Column(

        children: [
          BodyHeader(
            headerText: 'Available Domain',
          ),
          SizedBox(height: 16.rSp,),
          Padding(
            padding:  EdgeInsets.all(16.rSp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tap to create account or login',style: TextStyle(color: AppColors.appBarColors,fontWeight: FontWeight.bold),),
                SizedBox(height: 16.rSp,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Domain',
                    prefixIcon: Icon(Icons.email,)
                  )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


