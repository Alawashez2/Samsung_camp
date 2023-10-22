import 'package:flutter/material.dart';
import 'package:samsung_camp/components/cart_card.dart';
import 'package:samsung_camp/components/shopping_summary.dart';
import 'package:samsung_camp/components/text/text_widget.dart';
import 'package:samsung_camp/components/user_recommendation.dart';
import 'package:samsung_camp/constants/app_styles.dart';
import 'package:samsung_camp/constants/constants.dart';
import 'package:samsung_camp/data/global_data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: shoppingList.length,
              itemBuilder: (context, index) {
                return CartCard(product: shoppingList[index]);
              },
            ),
            ShoppingSummary(
              m: shoppingList.length,
            ),
            height32,
            const TextWidget(
              text: "Recommendation based on your last visit",
              size: 22,
              overflow: TextOverflow.clip,
            ),
            height8,
            const UserRecommendation(),
          ],
        ),
      ),
    );
  }
}
