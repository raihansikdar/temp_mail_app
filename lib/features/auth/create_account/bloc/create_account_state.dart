import 'package:equatable/equatable.dart';

abstract class CreateAccountState extends Equatable {
  const CreateAccountState();
}

class SignUpInitialState extends CreateAccountState {
  @override
  List<Object> get props => [];
}

class SignUpLoadingState extends CreateAccountState {
  @override
  List<Object> get props => [];
}

class SignUpSuccessState extends CreateAccountState {
  final String successMessage;
  const SignUpSuccessState({required this.successMessage});
  @override
  List<Object> get props => [successMessage];
}

class SignUpFailedState extends CreateAccountState {
  final String errorMessage;

  const SignUpFailedState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}