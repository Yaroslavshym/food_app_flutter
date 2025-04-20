import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppWelcome()) {
    // on<AppEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<AppWelcomed>(
      (event, emit) {
        emit(AppAuth());
      },
    );
    on<AppLoggedIn>(
      (event, emit) {
        // emit(());
        //       to main menu
      },
    );
  }
}
