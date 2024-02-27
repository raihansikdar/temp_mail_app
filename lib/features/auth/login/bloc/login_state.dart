import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class UserLoginInitialState extends LoginState {
  @override
  List<Object> get props => [];
}

class UserLoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class UserLoginSuccessState extends LoginState {
  final String successMessage;
  const UserLoginSuccessState({required this.successMessage});
  @override
  List<Object> get props => [successMessage];
}

class UserLoginFailedState extends LoginState {
  final String errorMessage;

  const UserLoginFailedState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}