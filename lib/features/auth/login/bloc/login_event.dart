import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class UserLoginEvent extends LoginEvent {
  final String address;
  final String password;

  const UserLoginEvent({required this.address, required this.password});

  @override
  List<Object> get props => [address, password];
}
