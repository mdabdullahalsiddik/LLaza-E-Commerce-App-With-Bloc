import 'dart:async';
import 'dart:developer' as developer;

import 'package:laza/features/bloc/presentation/pages/sing_in/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SingInEvent {
  Stream<SingInState> applyAsync(
      {SingInState currentState, SingInBloc bloc});
}

class UnSingInEvent extends SingInEvent {
  @override
  Stream<SingInState> applyAsync({SingInState? currentState, SingInBloc? bloc}) async* {
    yield UnSingInState();
  }
}

class LoadSingInEvent extends SingInEvent {
   
  @override
  Stream<SingInState> applyAsync(
      {SingInState? currentState, SingInBloc? bloc}) async* {
    try {
      yield UnSingInState();
      await Future.delayed(const Duration(seconds: 1));
      yield InSingInState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadSingInEvent', error: _, stackTrace: stackTrace);
      yield ErrorSingInState( _.toString());
    }
  }
}
