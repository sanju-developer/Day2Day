part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginWithGooglePressed extends LoginEvent {}

class LoginWithPhonePressed extends LoginEvent {}

class PhoneNumberEntered extends LoginEvent {
  final String phoneNumber;

  PhoneNumberEntered(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class OTPCodeEntered extends LoginEvent {
  final String otpCode;

  OTPCodeEntered(this.otpCode);

  @override
  List<Object> get props => [otpCode];
}

class ResendOTPPressed extends LoginEvent {
  final String phoneNumber;

  ResendOTPPressed(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}
