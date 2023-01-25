
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../custom/ButtonView.dart';
import '../../../../helper/AssetsHelper.dart';

class ItemBannerTile extends StatelessWidget {
  // final Function callback;
  // final b.Banner banner;

  const ItemBannerTile({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.5,
        child: Image(
          image: AssetsHelper.getImage("product_det.png"),
          fit: BoxFit.fitHeight,
        ),

      ),
    );
  }
}