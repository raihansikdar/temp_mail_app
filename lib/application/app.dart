import 'package:flutter/material.dart';
import 'package:temp_mail_app/constants/app_colors.dart';
import 'package:temp_mail_app/constants/custom_size_extension.dart';
import 'package:temp_mail_app/features/domain/views/domain_screen.dart';

class TempMailApp extends StatelessWidget {
  const TempMailApp({super.key});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;

    return MaterialApp(
      title: 'Temp Mail App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: AppColors.appBarTextColor,
              contentPadding: EdgeInsets.symmetric(horizontal: 16.rSp,vertical: 8.rSp),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.rSp),
                borderSide: BorderSide.none
              ),
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.3))
        ),
      ),
      home: const DomainScreen(),
    );
  }
}