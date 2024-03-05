// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class WelcomeState {}

class WelcomeInitial extends WelcomeState {}

class SocialSingInLoading extends WelcomeState {}

class SocialSingInSuccess extends WelcomeState {}

class SocialSingInError extends WelcomeState {
  final String error;
  SocialSingInError({
    required this.error,
  });
}
