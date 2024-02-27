import 'package:flutter/material.dart';
import 'package:temp_mail_app/constants/app_colors.dart';
import 'package:temp_mail_app/features/domain/views/domain_screen.dart';
import 'package:temp_mail_app/utility/auth_utility.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key, required this.leading, required this.action,
  }) : super(key: key);

  final bool leading;
  final bool action;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBarColors,
      title: const Text(
        'Temp Mail',
        style: TextStyle(color: AppColors.appBarTextColor),
      ),
      centerTitle: true,
      leading: leading == false ? null : GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back,color: AppColors.appBarTextColor,)),
      actions: action == false ? null : [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GestureDetector(
              onTap: ()async{
                await AuthUtility.clearInfo();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const DomainScreen()), (route) => false);
              },
              child: const Icon(Icons.logout,color: AppColors.appBarTextColor,)),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}