import 'package:flutter/material.dart';
import 'package:samsung_camp/components/badge_widget.dart';
import 'package:samsung_camp/components/card_widget.dart';
import 'package:samsung_camp/components/clear.dart';
import 'package:samsung_camp/components/department_card.dart';
import 'package:samsung_camp/components/text/text_widget.dart';
import 'package:samsung_camp/constants/app_styles.dart';
import 'package:samsung_camp/constants/constants.dart';
import 'package:samsung_camp/data/dapartmen_data.dart';
import 'package:samsung_camp/data/global_data.dart';
import 'package:samsung_camp/data/model/product.dart';
import 'package:samsung_camp/data/productData.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => ItemsScreenState();
}

class ItemsScreenState extends State<ItemsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var element in productData["products"]) {
      listProducts.add(Product.fromJson(element));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const TextWidget(
          text: "Products page",
          size: 22,
          color: Colors.white,
          isBold: true,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: BadgeWidget(
              color: lightPrimaryColor,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const TextWidget(
                  text: "Categories",
                  size: 22,
                ),
                width16,
                categories.isNotEmpty ? const ClearWidget() : Container()
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              // physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: departmentData.length,
              itemBuilder: (context, index) {
                return DepartmentCard(map: departmentData[index + 1]);
              },
            ),
          ),
          height16,
          ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: listProducts.length,
              itemBuilder: (BuildContext, index) {
                return categories.isEmpty
                    ? CardWidget(
                        product: listProducts[index],
                      )
                    : categories.contains(
                            departmentData[listProducts[index].departmentId]
                                ['department'])
                        ? CardWidget(
                            product: listProducts[index],
                          )
                        : Container();
              }),
        ],
      ),
    );
  }
}
