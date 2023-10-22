import 'package:flutter/material.dart';
import 'package:samsung_camp/components/text/text_widget.dart';
import 'package:samsung_camp/data/temp_model.dart';

class SmallCardWidget extends StatefulWidget {
  const SmallCardWidget({super.key, required this.temp});

  // final Word word;
  final Temp temp;
  // final int index;

  @override
  State<SmallCardWidget> createState() => SmallCardWidgetState();
}

class SmallCardWidgetState extends State<SmallCardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: const EdgeInsets.symmetric(vertical: 4),
      // color: Colors.orange[200],
      height: 120, // ToDo change
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(8),
        elevation: 5,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.end, //todo
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              widget.temp.image!,
                              height: 80,
                              width: 80,
                              fit: BoxFit.contain,
                            )),
                        Expanded(
                          child: TextWidget(
                            text: widget.temp.name!,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextWidget(
                      text: "${widget.temp.price.toString()} S.R",
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 14),
            //   child: TextWidget(
            //     text: "${widget.item.price!.toString()} S.R",
            //     size: 18,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
