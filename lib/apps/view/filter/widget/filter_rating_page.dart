import 'package:flutter/cupertino.dart';
import 'package:UShealthcare/apps/common/checkbox_tile.dart';

class FilterRatingPage extends StatefulWidget {
  const FilterRatingPage({Key? key}) : super(key: key);

  @override
  State<FilterRatingPage> createState() => _FilterRatingPageState();
}

class _FilterRatingPageState extends State<FilterRatingPage> {
  bool check1 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 2,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CheckBoxTile(
            value: check1,

            Title: '3\* & Above',
            callback: (bool value) {
              setState(() {
                check1 = value;
              });
            },
          );
        },
      ),);
  }
}
