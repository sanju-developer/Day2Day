part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {}

class OTPSentSuccess extends LoginState {}

class OTPReSentSuccess extends LoginState {}

class LoginInProgress extends LoginState {}
