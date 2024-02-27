import 'package:equatable/equatable.dart';

abstract class PasswordVisibilityEvent extends Equatable{
  const PasswordVisibilityEvent();
}
class PasswordVisibilityChangeEvent extends PasswordVisibilityEvent{
  @override
  List<Object?> get props => [];

}