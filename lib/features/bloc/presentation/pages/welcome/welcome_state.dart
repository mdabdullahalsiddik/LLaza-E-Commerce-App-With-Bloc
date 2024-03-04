import 'package:equatable/equatable.dart';

abstract class WelcomeState extends Equatable {
  WelcomeState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnWelcomeState extends WelcomeState {

  UnWelcomeState();

  @override
  String toString() => 'UnWelcomeState';
}

/// Initialized
class InWelcomeState extends WelcomeState {
  InWelcomeState(this.hello);
  
  final String hello;

  @override
  String toString() => 'InWelcomeState $hello';

  @override
  List<Object> get props => [hello];
}

class ErrorWelcomeState extends WelcomeState {
  ErrorWelcomeState(this.errorMessage);
 
  final String errorMessage;
  
  @override
  String toString() => 'ErrorWelcomeState';

  @override
  List<Object> get props => [errorMessage];
}
