import 'package:bloc/bloc.dart';
part 'badge_event.dart';
part 'badge_state.dart';

class BadgeBloc extends Bloc<BadgeEvent, BadgeState> {
  BadgeBloc() : super(BadgeInitial(0)) {
    on<AddProductEvent>((event, emit) {
      emit(GetBadgeState(state.badgeCount + event.number));
    });
  }
}
