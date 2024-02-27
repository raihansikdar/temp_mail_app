import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail_app/common_bloc/password_visibility_event.dart';
import 'package:temp_mail_app/common_bloc/password_visibility_state.dart';

class PasswordVisibilityBloc extends Bloc<PasswordVisibilityEvent, PasswordVisibilityState> {
  bool visible = false;

  PasswordVisibilityBloc() : super(PasswordVisibilityInitialState()) {
    on<PasswordVisibilityChangeEvent>((event, emit) {
      visible = !visible;
      emit(PasswordVisibilityUpdateState(visible: visible));
    });
  }
}