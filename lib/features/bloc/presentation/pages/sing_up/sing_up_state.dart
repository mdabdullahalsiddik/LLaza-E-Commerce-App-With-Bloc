import 'package:equatable/equatable.dart';

abstract class SingUpState extends Equatable {
  SingUpState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnSingUpState extends SingUpState {

  UnSingUpState();

  @override
  String toString() => 'UnSingUpState';
}

/// Initialized
class InSingUpState extends SingUpState {
  InSingUpState(this.hello);
  
  final String hello;

  @override
  String toString() => 'InSingUpState $hello';

  @override
  List<Object> get props => [hello];
}

class ErrorSingUpState extends SingUpState {
  ErrorSingUpState(this.errorMessage);
 
  final String errorMessage;
  
  @override
  String toString() => 'ErrorSingUpState';

  @override
  List<Object> get props => [errorMessage];
}
