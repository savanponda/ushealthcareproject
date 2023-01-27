import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/category_details_tile.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';

class CategoryDetailsList extends StatelessWidget {
  const CategoryDetailsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 100,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return CategoryDetailsTile(
            image: 'ic_fashion.png',
            title: buildTranslate(context, "fashion"),
            IconHeight: 50,
            IconWidth: 50,
          );
        },
      ),
    );
  }
}
