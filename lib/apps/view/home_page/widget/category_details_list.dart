import 'package:flutter/material.dart';
import 'package:onlinebia/apps/tiles/BannerTile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../style/AppColor.dart';
import '../../../common/category_details_tile.dart';

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
            title: 'Fashion',
            IconHeight: 60,
            IconWidth: 60,
          );
        },
      ),
    );
  }
}
