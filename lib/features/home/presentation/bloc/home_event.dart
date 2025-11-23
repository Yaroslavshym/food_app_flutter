part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class ChangeCurrentPageIndex extends HomeEvent {
  final int newCurrentPageIndex;

  ChangeCurrentPageIndex({required this.newCurrentPageIndex});
}

class ChangeCurrentCategoryIndex extends HomeEvent {
  final int currentCategoryIndex;

  ChangeCurrentCategoryIndex({required this.currentCategoryIndex});
}
