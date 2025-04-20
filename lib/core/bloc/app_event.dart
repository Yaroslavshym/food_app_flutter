part of 'app_bloc.dart';

@immutable
sealed class AppEvent {}

final class AppWelcomed extends AppEvent {}

final class AppLoggedIn extends AppEvent {}
