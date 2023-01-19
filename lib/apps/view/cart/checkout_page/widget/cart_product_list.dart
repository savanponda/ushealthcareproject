import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/product_tile.dart';

import '../tile/cart_product_tile.dart';

class CartProductList extends StatelessWidget {
  bool moveTocart;
  CartProductList({Key? key,required this.moveTocart}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      child:  Center(
        child: Wrap(
          spacing: MediaQuery.of(context).size.width*0.09,
          alignment: WrapAlignment.start,
          children: [
            for(int index=0;index<2;index++)
              CartProductTile(
                MoveToCart: moveTocart,
              )
          ],
        ),
      ),
    );
  }
}
