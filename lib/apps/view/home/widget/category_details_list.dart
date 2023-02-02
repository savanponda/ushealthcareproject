import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/category_details_tile.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';

class CategoryDetailsList extends StatelessWidget {
  const CategoryDetailsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 80,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return CategoryDetailsTile(
            image: index==4?'ic_category_filled.png':'ic_fashion.png',
            title: index==4?buildTranslate(context, "more"):buildTranslate(context, "fashion"),
            IconHeight: 50,
            IconWidth: 50,
          );
        },
      ),
    );
  }
}
