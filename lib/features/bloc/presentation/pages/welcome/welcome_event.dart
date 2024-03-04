import 'dart:async';
import 'dart:developer' as developer;

import 'package:laza/features/bloc/presentation/pages/welcome/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WelcomeEvent {
  Stream<WelcomeState> applyAsync(
      {WelcomeState currentState, WelcomeBloc bloc});
}

class UnWelcomeEvent extends WelcomeEvent {
  @override
  Stream<WelcomeState> applyAsync({WelcomeState? currentState, WelcomeBloc? bloc}) async* {
    yield UnWelcomeState();
  }
}

class LoadWelcomeEvent extends WelcomeEvent {
   
  @override
  Stream<WelcomeState> applyAsync(
      {WelcomeState? currentState, WelcomeBloc? bloc}) async* {
    try {
      yield UnWelcomeState();
      await Future.delayed(const Duration(seconds: 1));
      yield InWelcomeState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadWelcomeEvent', error: _, stackTrace: stackTrace);
      yield ErrorWelcomeState( _.toString());
    }
  }
}
