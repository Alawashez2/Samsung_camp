import 'package:flutter/material.dart';
import 'package:samsung_camp/components/text/text_widget.dart';
import 'package:samsung_camp/constants/app_styles.dart';
import 'package:samsung_camp/screens/items_screen.dart';

String department = "";
List<String> categories = [];

// ignore: must_be_immutable
class DepartmentCard extends StatefulWidget {
  DepartmentCard({
    super.key,
    required this.map,
  });
  Map map;

  @override
  State<DepartmentCard> createState() => _DepartmentCardState();
}

class _DepartmentCardState extends State<DepartmentCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
        width: 120,
        child: InkWell(
          onTap: () {
            setState(() {
              if (categories.contains(widget.map['department'])) {
                categories.remove(widget.map['department']);
              } else {
                categories.add(widget.map['department']);
              }
              context
                  .findAncestorStateOfType<ItemsScreenState>()
                  ?.setState(() {});
            });
          },
          child: Card(
            color: categories.contains(widget.map['department'])
                ? lightPrimaryColor
                : Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.all(4),
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    widget.map['picture'],
                    height: 50,
                    width: 50,
                    fit: BoxFit.fill,
                  ),
                ),
                TextWidget(
                  text: widget.map['department'],
                  size: 20,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
