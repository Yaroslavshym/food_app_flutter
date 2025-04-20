part of 'app_bloc.dart';

@immutable
sealed class AppState {}

final class AppWelcome extends AppState {}

final class AppAuth extends AppState {}
