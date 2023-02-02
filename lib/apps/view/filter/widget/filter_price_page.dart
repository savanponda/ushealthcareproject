import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/style/AppColor.dart';

import '../../../common/checkbox_tile.dart';

class FilterPricePage extends StatefulWidget {
   FilterPricePage({Key? key}) : super(key: key);

  @override
  State<FilterPricePage> createState() => _FilterPricePageState();
}

class _FilterPricePageState extends State<FilterPricePage> {
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
            Title: '\$20 and Above',
            callback: (bool value) {
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
