import 'package:flutter/material.dart';
import 'package:temp_mail_app/constants/assets_path.dart';
import 'package:temp_mail_app/features/domain/views/domain_screen.dart';
import 'package:temp_mail_app/features/home/views/home_screen.dart';
import 'package:temp_mail_app/utility/auth_utility.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState()  {
    goNextPage();
    super.initState();
  }

  void goNextPage()async{
    await AuthUtility.getAccessToken();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> AuthUtility.isLoggedIn ? HomeScreen() : const DomainScreen()), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(child: Image.asset(AssetsPath.logoPNG,fit: BoxFit.cover,)),
    );
  }
}