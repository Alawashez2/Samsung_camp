import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samsung_camp/bloc/badge/badge_bloc.dart';
import 'package:samsung_camp/components/shopping_summary.dart';
import 'package:samsung_camp/components/text/text_widget.dart';
import 'package:samsung_camp/constants/app_styles.dart';
import 'package:samsung_camp/data/model/product.dart';
import 'package:samsung_camp/extensions/dialog.dart';
import 'package:samsung_camp/extensions/navigator.dart';
import 'package:samsung_camp/screens/cart_screen.dart';
import 'package:samsung_camp/screens/item_details.dart';
import 'package:samsung_camp/service/apiserp.dart';
import 'package:samsung_camp/util/add_to_cart.dart';

class recommendationCard extends StatefulWidget {
  const recommendationCard({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  State<recommendationCard> createState() => _recommendationCardState();
}

class _recommendationCardState extends State<recommendationCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 200,
          height: 500, // ToDo change
          child: InkWell(
            onTap: () {
              setState(() {
                context.getNavigator(ItemDetails(
                  product: widget.product,
                ));
              });
            },
            child: Card(
              // color: Colors.grey.shade100,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.all(4),
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: FutureBuilder(
                      future: GetSerper().getImage(widget.product.productName!),
                      builder: (context, snapshot2) {
                        if (snapshot2.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot2.hasError) {
                          return Text('Error: ${snapshot2.error}');
                        } else if (!snapshot2.hasData ||
                            snapshot2.data!.isEmpty) {
                          return const Text('No data available.');
                        } else {
                          widget.product.image = snapshot2.data;
                          return Image.network(
                            widget.product.image!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              widget.product.image =
                                  "https://content.gobsn.com/i/bodyandfit/no-xplode_Image_01?layer0=\$PDP\$";
                              return Image.network(
                                widget.product.image!,
                                height: 100,
                                width: 100,
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextWidget(
                      text: widget.product.productName!,
                      size: 20,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  TextWidget(
                    text: "${widget.product.price} S.R",
                    size: 20,
                    isBold: true,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            height: 45,
            width: 45,
            child: Center(
              child: IconButton(
                onPressed: () {
                  context.read<BadgeBloc>().add(AddProductEvent(1));
                  widget.product.quantity = 1;
                  addToCart(product: widget.product, quantity: 1);
                  context
                      .findAncestorStateOfType<ShoppingSummaryState>()
                      ?.setState(() {});
                  context
                      .findAncestorStateOfType<CartScreenState>()
                      ?.setState(() {});
                  context.dialogScreenCorrect();
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
