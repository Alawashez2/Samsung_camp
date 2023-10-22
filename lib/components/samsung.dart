import 'package:flutter/material.dart';
import 'package:samsung_camp/components/recommendation_card.dart';
import 'package:samsung_camp/data/global_data.dart';
import 'package:samsung_camp/data/model/product.dart';
import 'package:samsung_camp/service/fastApi.dart';

class ProductRecommendations extends StatefulWidget {
  const ProductRecommendations({super.key, required this.product});
  final Product product;

  @override
  _ProductRecommendationsState createState() => _ProductRecommendationsState();
}

class _ProductRecommendationsState extends State<ProductRecommendations> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: FastApi().getRecommendation(widget.product),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No data available.');
        } else {
          // Access specific fields from the JSON response
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return recommendationCard(
                product: listNet[index],
              );
            },
          );
        }
      },
    );
  }
}
