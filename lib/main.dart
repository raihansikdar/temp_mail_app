import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail_app/application/app.dart';
import 'package:temp_mail_app/common_bloc/password_visibility_bloc.dart';
import 'package:temp_mail_app/features/auth/create_account/bloc/create_account_bloc.dart';
import 'package:temp_mail_app/features/auth/login/bloc/login_bloc.dart';
import 'package:temp_mail_app/features/domain/bloc/domain_bloc.dart';
import 'package:temp_mail_app/features/home/bloc/message_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (_)=> DomainBloc()),
      BlocProvider(create: (_)=> CreateAccountBloc()),
      BlocProvider(create: (_)=> PasswordVisibilityBloc()),
      BlocProvider(create: (_)=> LoginBloc()),
      BlocProvider(create: (_)=> MessageBloc()),
    ], child: const TempMailApp())
  );
}




