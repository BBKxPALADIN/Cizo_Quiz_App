part of 'login_bloc.dart';

class LoginState {
  final String userEmail;
  int get isValidEmail{
    if(userEmail.isEmpty)
      return 1;
    else if(!userEmail.contains('@') && userEmail.length < 6)
      return 2;
    else
      return null;
  }

  final String password;
  int get isValidPassword{
    if(password.isEmpty)
      return 1;
    else if(password.length < 5)
      return 2;
    else
      return null;
  }

  final FormSubmissionState formState;

  LoginState({
    this.userEmail = '',
    this.password = '',
    this.formState = const InitialFormState(),
  });

  LoginState copyWith({
    String userEmail,
    String password,
    FormSubmissionState formState,
  }) {
    return LoginState(
      userEmail: userEmail ?? this.userEmail,
      password: password ?? this.password,
      formState: formState ?? this.formState,
    );
  }
}
