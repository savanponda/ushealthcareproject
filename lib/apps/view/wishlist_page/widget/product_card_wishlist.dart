import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/product_tile.dart';

class ProductCardWishList extends StatelessWidget {
  ProductCardWishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Center(
        child: Wrap(
          spacing: 30,
          children: [
            for(int index=0;index<6;index++)
              ProductTile(buttonLiked: true)
          ],
        ),
      ),
    );
  }
}
