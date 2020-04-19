import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:day2day/services/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;

  LoginBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginWithGooglePressed) {
      yield* _mapLoginWithGoogleToState();
    } else if (event is PhoneNumberEntered) {
      yield* _mapPhoneNumberEnteredToState(event.phoneNumber);
    } else if (event is OTPCodeEntered) {
      yield* _mapOTPCodeEnteredToState(event.otpCode);
    } else if (event is ResendOTPPressed) {
      yield* _mapResendOTPToState(event.phoneNumber);
    }
  }

  Stream<LoginState> _mapLoginWithGoogleToState() async* {
    try {
      await _userRepository.signInWithGoogle();
      yield LoginSuccess();
    } catch (e) {
      print('Exception while google signin $e');
      yield LoginFailure();
    }
  }

  Stream<LoginState> _mapPhoneNumberEnteredToState(String phoneNumber) async* {
    try {
      await _userRepository.verifyPhoneNumber(phoneNumber);
      yield OTPSentSuccess();
    } catch (e) {
      print("_mapPhoneNumberEnteredToState $e");
      yield LoginFailure();
    }
  }

  Stream<LoginState> _mapOTPCodeEnteredToState(String otpCode) async* {
    try {
      await _userRepository.signInWithOTP(otpCode);
      yield LoginSuccess();
    } catch (e) {
      print("_mapOTPCodeEnteredToState $e");
      yield LoginFailure();
    }
  }

  Stream<LoginState> _mapResendOTPToState(String phoneNumber) async* {
    try {
      await _userRepository.resendOTP(phoneNumber);
      yield OTPReSentSuccess();
    } catch (e) {
      print("_mapResendOTPToState $e");
      yield LoginFailure();
    }
  }
}
