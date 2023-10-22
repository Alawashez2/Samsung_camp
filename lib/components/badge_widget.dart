import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samsung_camp/bloc/badge/badge_bloc.dart';
import 'package:samsung_camp/components/text/text_widget.dart';
import 'package:samsung_camp/constants/app_styles.dart';
import 'package:samsung_camp/data/global_data.dart';
import 'package:samsung_camp/extensions/navigator.dart';
import 'package:samsung_camp/screens/cart_screen.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BadgeBloc, BadgeState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.getNavigator(const CartScreen());
          },
          child: badges.Badge(
            badgeStyle: badges.BadgeStyle(badgeColor: color ?? primaryColor),
            badgeContent: TextWidget(
              text: state.badgeCount.toString(),
              color: Colors.white,
              size: 18,
            ),
            showBadge: shoppingList.isNotEmpty ? true : false,
            child: const Icon(
              Icons.shopping_cart_outlined,
              size: 34,
            ),
          ),
        );
      },
    );
  }
}
