import 'package:meta/meta.dart';

@immutable
abstract class WelcomeEvent {}

class RequestGoogleSingIn extends WelcomeEvent {}
class RequestFacebookSingIn extends WelcomeEvent {}
class RequestTwitterSingIn extends WelcomeEvent {}
