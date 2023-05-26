part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInAuth extends SignInEvent {
  final String email;
  final String password;

  SignInAuth({
    required this.email,
    required this.password,
  });
}