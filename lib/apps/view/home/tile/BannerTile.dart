
import 'package:flutter/material.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';

class BannerTile extends StatelessWidget {
  // final Function callback;
  // final b.Banner banner;

  const BannerTile({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image(
            image: AssetsHelper.getImage("slider_img.png"),
          ),

        ),
      ),
    );
  }
}