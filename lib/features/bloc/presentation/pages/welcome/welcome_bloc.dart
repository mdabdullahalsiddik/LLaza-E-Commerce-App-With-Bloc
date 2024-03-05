import 'package:bloc/bloc.dart';
import 'package:laza/features/bloc/domain/repositories/auth_repositories.dart';
import 'package:laza/features/bloc/presentation/pages/welcome/welcome_event.dart';
import 'package:laza/features/bloc/presentation/pages/welcome/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final AuthRepositories authRepositories;
  WelcomeBloc(this.authRepositories) : super(WelcomeInitial()) {
    on<RequestGoogleSingIn>(
      (event, emit) async {
        try {
          emit(SocialSingInLoading());
          final user = await authRepositories.signInWithGoogle();
          emit(SocialSingInSuccess());
        } catch (e) {
          emit(SocialSingInError(error: e.toString()));
        }
      },
    );
    on<RequestFacebookSingIn>(
      (event, emit) async {
        try {
          emit(SocialSingInLoading());
          final user = await authRepositories.signInWithFacebook();
          emit(SocialSingInSuccess());
        } catch (e) {
          emit(SocialSingInError(error: e.toString()));
        }
      },
    ); on<RequestTwitterSingIn>(
      (event, emit) async {
        try {
          emit(SocialSingInLoading());
          final user = await authRepositories.signInWithTwitter();
          emit(SocialSingInSuccess());
        } catch (e) {
          emit(SocialSingInError(error: e.toString()));
        }
      },
    );
  }
}
