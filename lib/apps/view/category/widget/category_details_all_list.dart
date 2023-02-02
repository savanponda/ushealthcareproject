import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/category_details_tile.dart';
import 'package:onlinebia/apps/view/filter/filter_page.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';

class CategoryDetailsAllList extends StatelessWidget {



  const CategoryDetailsAllList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Wrap(
        spacing: MediaQuery.of(context).size.width*0.09,
        runSpacing: 30,
        alignment: WrapAlignment.start,
        children: [
          for(int index=0;index<11;index++)
            CategoryDetailsTile(
              image: 'ic_fashion.png',
              title:  buildTranslate(context, "fashion"),
              IconHeight: 70,
              IconWidth: 70,
            )
        ],
      ),
    );
  }
}
