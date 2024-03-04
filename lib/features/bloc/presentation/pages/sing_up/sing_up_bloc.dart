import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:laza/features/bloc/presentation/pages/sing_up/index.dart';

class SingUpBloc extends Bloc<SingUpEvent, SingUpState> {

  SingUpBloc(SingUpState initialState) : super(initialState){
   on<SingUpEvent>((event, emit) {
      return emit.forEach<SingUpState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'SingUpBloc', error: error, stackTrace: stackTrace);
          return ErrorSingUpState(error.toString());
        },
      );
    });
  }
}
