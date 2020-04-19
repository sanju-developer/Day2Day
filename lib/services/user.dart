import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  String _verificationId;
  int _forceResendingToken;

  UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn();

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _firebaseAuth.signInWithCredential(credential);
    return _firebaseAuth.currentUser();
  }

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<String> getUser() async {
    return (await _firebaseAuth.currentUser()).email;
  }

  void _codeSent(String verificationId, [int forceResendingToken]) async {
    this._verificationId = verificationId;
    this._forceResendingToken = forceResendingToken;
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: Duration(seconds: 0), // Disabling auto code retrieval for now
      verificationCompleted: null,
      verificationFailed: null,
      codeSent: _codeSent,
      codeAutoRetrievalTimeout: null,
    );
  }

  Future<void> resendOTP(String phoneNumber) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      forceResendingToken: _forceResendingToken,
      timeout: Duration(seconds: 0), // Disabling auto code retrieval for now
      verificationCompleted: null,
      verificationFailed: null,
      codeSent: _codeSent,
      codeAutoRetrievalTimeout: null,
    );
  }

  Future<FirebaseUser> signInWithOTP(String otpCode) async {
    AuthCredential _authCredential = PhoneAuthProvider.getCredential(
        verificationId: this._verificationId, smsCode: otpCode);
    AuthResult result =
        await _firebaseAuth.signInWithCredential(_authCredential);
    return result.user;
  }
}
