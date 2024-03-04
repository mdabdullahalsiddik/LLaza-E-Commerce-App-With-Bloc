import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:laza/features/bloc/presentation/pages/sing_in/index.dart';

class SingInBloc extends Bloc<SingInEvent, SingInState> {

  SingInBloc(SingInState initialState) : super(initialState){
   on<SingInEvent>((event, emit) {
      return emit.forEach<SingInState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'SingInBloc', error: error, stackTrace: stackTrace);
          return ErrorSingInState(error.toString());
        },
      );
    });
  }
}
