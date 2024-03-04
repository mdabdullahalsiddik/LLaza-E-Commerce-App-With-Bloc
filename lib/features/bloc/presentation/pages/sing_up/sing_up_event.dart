import 'dart:async';
import 'dart:developer' as developer;

import 'package:laza/features/bloc/presentation/pages/sing_up/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SingUpEvent {
  Stream<SingUpState> applyAsync(
      {SingUpState currentState, SingUpBloc bloc});
}

class UnSingUpEvent extends SingUpEvent {
  @override
  Stream<SingUpState> applyAsync({SingUpState? currentState, SingUpBloc? bloc}) async* {
    yield UnSingUpState();
  }
}

class LoadSingUpEvent extends SingUpEvent {
   
  @override
  Stream<SingUpState> applyAsync(
      {SingUpState? currentState, SingUpBloc? bloc}) async* {
    try {
      yield UnSingUpState();
      await Future.delayed(const Duration(seconds: 1));
      yield InSingUpState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadSingUpEvent', error: _, stackTrace: stackTrace);
      yield ErrorSingUpState( _.toString());
    }
  }
}
