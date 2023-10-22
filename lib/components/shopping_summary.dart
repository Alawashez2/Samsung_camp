import 'package:flutter/material.dart';
import 'package:samsung_camp/components/text/text_widget.dart';
import 'package:samsung_camp/constants/app_styles.dart';
import 'package:samsung_camp/constants/constants.dart';
import 'package:samsung_camp/screens/cart_screen.dart';
import 'package:samsung_camp/util/add_to_cart.dart';

class ShoppingSummary extends StatefulWidget {
  const ShoppingSummary({super.key, required this.m});
  final int m;

  @override
  State<ShoppingSummary> createState() => ShoppingSummaryState();
}

class ShoppingSummaryState extends State<ShoppingSummary> {
  // int quantity = 0;
  // double totalPrice = 0;
  bool isHided = true;
  String coupon = "";
  bool hasCoupon = false;

  @override
  Widget build(BuildContext context) {
    // totalPrices();
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        // color: lightGrayColor,
        borderRadius: BorderRadius.circular(15),
      ),
      width: AppLayout.getSize(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextWidget(
                text: "Summary",
                size: 22,
              ),
              TextWidget(
                text: "$allQuantity item/s",
                size: 22,
              ),
            ],
          ),
          height24,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextWidget(
                text: "total amount",
                size: 22,
              ),
              TextWidget(
                text: "${totalPrice.toStringAsFixed(2)} S.R",
                size: 22,
              ),
            ],
          ),
          height56,
          // const CouponWidget(),
          TextButton(
            onPressed: () {
              setState(() {
                isHided = !isHided;
              });
            },
            child: const TextWidget(
              text: "Have a coupon ?",
              size: 20,
              color: Colors.blue,
            ),
          ),
          height8,
          Offstage(
            offstage: isHided,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      coupon = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter a coupon",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: primaryColor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryColor)),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      if (coupon == "SIC") {
                        hasCoupon = true;
                        context
                            .findAncestorStateOfType<CartScreenState>()
                            ?.setState(() {});
                      }
                    },
                    child: const TextWidget(
                      text: "Apply",
                      color: Colors.blue,
                      size: 16,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Visibility(
              visible: hasCoupon,
              child: Center(
                child: Column(
                  children: [
                    TextWidget(
                      text: "old price is $totalPrice S.R",
                      lineThrough: true,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),
                    height4,
                    TextWidget(
                      text: "New price is ${totalPrice / 2} S.R",
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
