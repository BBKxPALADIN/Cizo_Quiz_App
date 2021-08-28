import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiz_app/bloc/auth_repository.dart';
import 'package:quiz_app/bloc/form_submission_state.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;

  LoginBloc({
    this.authRepo,
  }) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginUserEmailChanged) {
      yield state.copyWith(userEmail: event.userEmail);
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formState: FormSubmitting());

      try {
        await authRepo.login();
        yield state.copyWith(formState: SubmissionSuccess());
      } catch (error) {
        yield state.copyWith(formState: SubmissionFailed(error));
      }
    }
  }
}
