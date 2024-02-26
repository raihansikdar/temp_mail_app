import 'package:equatable/equatable.dart';

abstract class CreateAccountEvent extends Equatable {
  const CreateAccountEvent();
}

class SignUpEvent extends CreateAccountEvent {
  final String address;
  final String password;

  SignUpEvent({required this.address, required this.password});

  @override
  List<Object> get props => [address, password];
}
