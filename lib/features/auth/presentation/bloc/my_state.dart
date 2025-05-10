// this enum is used to make sure that even if state is auth loading we know what correct state was used
import 'auth_bloc.dart';

enum MyStates { register, login, other }

class MyState {
  static MyStates findState({required AuthState state}) {
    // returns login only if its login state or loading state but previous was login state
    if (state is AuthLoginState ||
        (state is AuthLoadingState &&
            (state as AuthLoadingState).previousState is AuthLoginState)) {
      return MyStates.login;

      // returns register only if its register state or loading state but previous was register state
    } else if (state is AuthRegisterState ||
        (state is AuthLoadingState &&
            (state as AuthLoadingState).previousState is AuthRegisterState)) {
      return MyStates.register;
    } else {
      return MyStates.other;
    }
  }
}
