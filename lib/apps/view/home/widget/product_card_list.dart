import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/common/product_tile.dart';

class ProductCardList extends StatelessWidget {
  ProductCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Center(
        child: Wrap(
          spacing: 30,
          children: [
            for(int index=0;index<6;index++)
              ProductTile(likedIcon: false,)
          ],
        ),
      ),
    );
  }
}
