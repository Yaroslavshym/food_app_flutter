import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int currentPageIndex = 0;
  int currentCategoryIndex = 0;

  HomeBloc() : super(MenuInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ChangeCurrentPageIndex>((event, emit) {
      currentPageIndex = event.newCurrentPageIndex;
      emit(MenuInitial());
    });
    on<ChangeCurrentCategoryIndex>((event, emit) {
      currentCategoryIndex = event.currentCategoryIndex;
      emit(MenuInitial());
    });
  }
}
