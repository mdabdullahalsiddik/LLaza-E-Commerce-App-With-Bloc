import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:laza/features/bloc/presentation/pages/welcome/index.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {

  WelcomeBloc(WelcomeState initialState) : super(initialState){
   on<WelcomeEvent>((event, emit) {
      return emit.forEach<WelcomeState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'WelcomeBloc', error: error, stackTrace: stackTrace);
          return ErrorWelcomeState(error.toString());
        },
      );
    });
  }
}
