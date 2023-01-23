import 'package:flutter/material.dart';
import '../../../common/category_details_tile.dart';

class CategoryDetailsAllList extends StatelessWidget {
  const CategoryDetailsAllList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Center(
      child: Wrap(
        spacing: MediaQuery.of(context).size.width*0.09,
        alignment: WrapAlignment.start,
        children: [
          for(int index=0;index<11;index++)
            CategoryDetailsTile(
              image: 'ic_fashion.png',
              title: 'Fashion',
              IconHeight: 80,
              IconWidth: 80,
            )
        ],
      ),
    );
  }
}
