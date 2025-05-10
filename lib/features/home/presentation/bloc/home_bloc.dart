import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int currentIndex = 0;
  HomeBloc() : super(MenuInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ChangeCurrentBottomNavBarIndex>((event, emit) {
      currentIndex = event.newCurrentIndex;
      emit(MenuInitial());
    });
  }
}
