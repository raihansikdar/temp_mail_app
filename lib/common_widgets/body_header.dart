import 'package:flutter/material.dart';
import 'package:temp_mail_app/constants/app_colors.dart';
import 'package:temp_mail_app/constants/custom_size_extension.dart';

class BodyHeader extends StatelessWidget {
  const BodyHeader({
    super.key, required this.headerText,
  });
  final String headerText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(height: 1.rSp,color: AppColors.appBarTextColor,thickness: 1.rSp,),
        Container(
          height: 100.rSp,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.appBarColors,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.rSp),
                bottomRight: Radius.circular(24.rSp),
              )
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.rSp,vertical: 16.rSp),
            child: Text(headerText,style: const TextStyle(color: AppColors.appBarTextColor),textAlign: TextAlign.right,),
          ),
        ),

      ],
    );
  }
}