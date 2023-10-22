import 'package:flutter/material.dart';
import 'package:samsung_camp/components/badge_widget.dart';
import 'package:samsung_camp/components/quantity_button.dart';
import 'package:samsung_camp/components/text/text_widget.dart';
import 'package:samsung_camp/constants/app_styles.dart';
import 'package:samsung_camp/constants/constants.dart';
import 'package:samsung_camp/data/model/product.dart';
import 'package:samsung_camp/components/samsung.dart';

int quantityNumber = 1;

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key, required this.product});

  final Product product;
  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  bool isLocal = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPrimaryColor,
      appBar: AppBar(
        backgroundColor: lightPrimaryColor,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: BadgeWidget(),
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 150,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40))
                  // borderRadius: BorderRadius.all(Radius.circular(50))

                  ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    height112,
                    TextWidget(
                      text: widget.product.productName.toString(),
                      overflow: TextOverflow.clip,
                      size: 24,
                      isBold: true,
                    ),
                    height16,
                    QuantityButton(
                      product: widget.product,
                    ),
                    height48,
                    const TextWidget(
                      text: "Discover similar items",
                      size: 24,
                    ),
                    height16,
                    Expanded(
                      child: ProductRecommendations(product: widget.product),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 50,
            right: 50,
            bottom: 550,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(200)),
                child: Image.network(
                  widget.product.image!,
                  height: 100,
                  width: 100,
                  // width: AppLayout.getSize(context).width,
                  fit: BoxFit.fill,
                )),
          ),
        ],
      ),
    );
  }
}

// CardWidget(item: listItems[index],);