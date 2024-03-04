import 'package:equatable/equatable.dart';

abstract class SingInState extends Equatable {
  SingInState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnSingInState extends SingInState {

  UnSingInState();

  @override
  String toString() => 'UnSingInState';
}

/// Initialized
class InSingInState extends SingInState {
  InSingInState(this.hello);
  
  final String hello;

  @override
  String toString() => 'InSingInState $hello';

  @override
  List<Object> get props => [hello];
}

class ErrorSingInState extends SingInState {
  ErrorSingInState(this.errorMessage);
 
  final String errorMessage;
  
  @override
  String toString() => 'ErrorSingInState';

  @override
  List<Object> get props => [errorMessage];
}
