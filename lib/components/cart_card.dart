import 'package:flutter/material.dart';
import 'package:samsung_camp/components/text/text_widget.dart';
import 'package:samsung_camp/constants/constants.dart';
import 'package:samsung_camp/data/model/product.dart';

class CartCard extends StatefulWidget {
  const CartCard({super.key, required this.product});

  final Product product;

  @override
  State<CartCard> createState() => CartCardState();
}

class CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: const EdgeInsets.symmetric(vertical: 4),
      // color: Colors.orange[200],
      height: 140, // ToDo change
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(10),
        elevation: 5,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child:
                      // CachedNetworkImage(
                      //     imageUrl: widget.product.image!);
                      ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      widget.product.image!,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                width16,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextWidget(
                              text: widget.product.productName!,
                              size: 22,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 14),
                            child: TextWidget(
                              text: "${widget.product.price} S.R",
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      height24,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextWidget(
                            text: "Quantity: ${widget.product.quantity}",
                            size: 16,
                          ),
                          TextWidget(
                            text:
                                "Total: ${widget.product.quantity! * widget.product.price!} S.R",
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
