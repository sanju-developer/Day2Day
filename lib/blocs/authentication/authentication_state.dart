part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object> get props => [];
}

class AuthenticationUnintialized extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final String name;

  AuthenticationSuccess(this.name);

  @override
  List<Object> get props => [name];
}

class AuthenticationFailure extends AuthenticationState {}

class AuthenticationInProgress extends AuthenticationState {}
