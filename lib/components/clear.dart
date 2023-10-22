import 'package:flutter/material.dart';
import 'package:samsung_camp/components/department_card.dart';
import 'package:samsung_camp/components/text/text_widget.dart';
import 'package:samsung_camp/constants/app_styles.dart';
import 'package:samsung_camp/screens/items_screen.dart';

class ClearWidget extends StatefulWidget {
  const ClearWidget({super.key});

  @override
  State<ClearWidget> createState() => _ClearWidgetState();
}

class _ClearWidgetState extends State<ClearWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        categories.clear();
        context.findAncestorStateOfType<ItemsScreenState>()?.setState(() {});
        setState(() {});
      },
      child: Container(
        height: 20,
        width: 60,
        decoration: BoxDecoration(
          color: lightPrimaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: const Center(
          child: TextWidget(
            text: "Clear",
            size: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
