import 'package:flutter/material.dart';
import 'package:samsung_camp/components/text/text_widget.dart';
import 'package:samsung_camp/constants/constants.dart';
import 'package:samsung_camp/data/model/product.dart';
import 'package:samsung_camp/extensions/navigator.dart';
import 'package:samsung_camp/screens/item_details.dart';
import 'package:samsung_camp/service/apiserp.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key, required this.product});

  final Product product;

  @override
  State<CardWidget> createState() => CardWidgetState();
}

class CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: const EdgeInsets.symmetric(vertical: 4),
      // color: Colors.orange[200],
      height: 180, // ToDo change
      child: InkWell(
        onTap: () {
          setState(() {
            context.getNavigator(ItemDetails(
              product: widget.product,
            ));
          });
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: const EdgeInsets.all(10),
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //todo
            children: [
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: FutureBuilder(
                          future:
                              GetSerper().getImage(widget.product.productName!),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return const Text('No data available.');
                            } else {
                              widget.product.image = snapshot.data!;
                              return
                                  // CachedNetworkImage(
                                  //     imageUrl: widget.product.image!);
                                  ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  errorBuilder: (context, error, stackTrace) {
                                    widget.product.image =
                                        "https://content.gobsn.com/i/bodyandfit/no-xplode_Image_01?layer0=\$PDP\$";
                                    return Image.network(
                                      widget.product.image!,
                                      height: 100,
                                      width: 100,
                                    );
                                  },
                                  widget.product.image!,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              );
                            }
                          }),
                    ),
                    width16,
                    Expanded(
                      child: TextWidget(
                        text: widget.product.productName!,
                        size: 22,
                      ),
                    ),
                  ],
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
        ),
      ),
    );
  }
}
