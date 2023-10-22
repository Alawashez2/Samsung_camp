import 'package:flutter/material.dart';
import 'package:samsung_camp/components/recommendation_card.dart';
import 'package:samsung_camp/data/global_data.dart';
import 'package:samsung_camp/service/fastApi.dart';

class UserRecommendation extends StatefulWidget {
  const UserRecommendation({super.key});

  @override
  _UserRecommendationState createState() => _UserRecommendationState();
}

class _UserRecommendationState extends State<UserRecommendation> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: FastApi().GetUserRecommendation(),
      builder: (context, snapshot) {
        print("Snap: ${snapshot.data}");
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No data available.');
        } else {
          // Access specific fields from the JSON response
          return SizedBox(
            height: 300,
            // width: 100,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return recommendationCard(
                  product: userRecommendationList[index],
                );
              },
            ),
          );
        }
      },
    );
  }
}
