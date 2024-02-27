import 'package:equatable/equatable.dart';

abstract class PasswordVisibilityState extends Equatable{
  const PasswordVisibilityState();
}
class PasswordVisibilityInitialState extends PasswordVisibilityState{

  @override
  List<Object?> get props => [];

}

class PasswordVisibilityUpdateState extends PasswordVisibilityState{
  bool visible;
  PasswordVisibilityUpdateState({required this.visible});
  @override
  List<Object?> get props => [visible];

}