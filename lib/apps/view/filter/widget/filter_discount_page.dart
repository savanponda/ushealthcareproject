import 'package:flutter/cupertino.dart';
import 'package:UShealthcare/apps/common/checkbox_tile.dart';

class FilterDiscountPage extends StatefulWidget {
  const FilterDiscountPage({Key? key}) : super(key: key);

  @override
  State<FilterDiscountPage> createState() => _FilterDiscountPageState();
}

class _FilterDiscountPageState extends State<FilterDiscountPage> {
  bool check1 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CheckBoxTile(
            value: check1,
            Title: '30\% or More', callback: (bool value) {
            setState(() {
              check1 = value;
            });
          },
          );
        },
      ),
    );
  }
}
