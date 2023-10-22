part of 'badge_bloc.dart';

abstract class BadgeState {
  final int badgeCount;

  BadgeState(this.badgeCount);
}

final class BadgeInitial extends BadgeState {
  BadgeInitial(super.badgeCount);
}

final class GetBadgeState extends BadgeState {
  GetBadgeState(super.badgeCount);
}
