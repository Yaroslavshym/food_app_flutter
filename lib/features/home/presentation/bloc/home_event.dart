part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class ChangeCurrentBottomNavBarIndex extends HomeEvent {
  final int newCurrentIndex;
  ChangeCurrentBottomNavBarIndex({required this.newCurrentIndex});
}
