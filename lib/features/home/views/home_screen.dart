import 'package:flutter/material.dart';
import 'package:temp_mail_app/common_widgets/body_header.dart';
import 'package:temp_mail_app/common_widgets/custom_appbar.dart';
import 'package:temp_mail_app/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key,  this.domainName}) : super(key: key);
   String? domainName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(leading: true, action: true,),
      body: Column(
        children: [
          BodyHeader(
            headerText: domainName ?? '',
          ),
        ],
      ),
    );
  }
}
