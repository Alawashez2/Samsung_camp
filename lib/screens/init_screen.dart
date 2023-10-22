import 'package:flutter/material.dart';
import 'package:samsung_camp/components/button.dart';
import 'package:samsung_camp/components/custom_clip_path.dart';
import 'package:samsung_camp/components/text/text_widget.dart';
import 'package:samsung_camp/constants/app_styles.dart';
import 'package:samsung_camp/constants/constants.dart';
import 'package:samsung_camp/extensions/navigator.dart';
import 'package:samsung_camp/screens/items_screen.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset("assets/foodback.jpg"),
                Padding(
                  padding: const EdgeInsets.only(top: 450),
                  child: ClipPath(
                    clipper: CustomClipPath(), // show a wave curve
                    child: Container(
                      color: Colors.white,
                      height: 160,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Column(
                children: [
                  const TextWidget(text: "Welcome", isBold: true),
                  height8,
                  const TextWidget(
                    text: "We wish you a great experience",
                    size: 26,
                  ),
                  height56,
                  Button(
                    text: "Get Started",
                    borderRadius: 20,
                    onPress: () {
                      context.pushAndRemoveNav(const ItemsScreen());
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}
