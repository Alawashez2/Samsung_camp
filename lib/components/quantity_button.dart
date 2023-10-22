import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samsung_camp/bloc/badge/badge_bloc.dart';
import 'package:samsung_camp/components/text/text_widget.dart';
import 'package:samsung_camp/constants/app_styles.dart';
import 'package:samsung_camp/constants/constants.dart';
import 'package:samsung_camp/data/model/product.dart';
import 'package:samsung_camp/extensions/dialog.dart';
import 'package:samsung_camp/screens/item_details.dart';
import 'package:samsung_camp/util/add_to_cart.dart';

class QuantityButton extends StatefulWidget {
  const QuantityButton({super.key, required this.product});
  final Product product;

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                color: lightPrimaryColor,
              ),
              height: 40,
              width: 40,
              child: Center(
                  child: IconButton(
                      onPressed: () {
                        if (quantityNumber > 1) {
                          quantityNumber--;
                        }
                        setState(() {});
                      },
                      icon: const Icon(Icons.remove))),
            ),
            Container(
                height: 40,
                width: 40,
                color: Colors.white,
                child: Center(
                  child: TextWidget(
                    text: quantityNumber.toString(),
                    size: 24,
                  ),
                )),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: lightPrimaryColor,
              ),
              child: Center(
                  child: IconButton(
                      onPressed: () {
                        quantityNumber++;
                        setState(() {});
                      },
                      icon: const Icon(Icons.add))),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              text: "${widget.product.price.toString()} S.R",
              size: 22,
            ),
            width16,
            IconButton(
                onPressed: () {
                  context
                      .read<BadgeBloc>()
                      .add(AddProductEvent(quantityNumber));
                  widget.product.quantity = quantityNumber;
                  addToCart(product: widget.product, quantity: quantityNumber);
                  context.dialogScreenCorrect();
                  quantityNumber = 1;
                  setState(() {});
                },
                icon: Icon(
                  Icons.add_shopping_cart,
                  size: 32,
                  color: primaryColor,
                ))
          ],
        ),
      ],
    );
  }
}
