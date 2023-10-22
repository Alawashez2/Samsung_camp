part of 'badge_bloc.dart';

abstract class BadgeEvent {}

final class AddProductEvent extends BadgeEvent {
  final int number;

  AddProductEvent(this.number);
}
