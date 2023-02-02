import 'package:flutter/material.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'ItemBannerTile.dart';

class ProductBanner extends StatelessWidget {
  const ProductBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    PageController controller = PageController(viewportFraction: 1, keepPage: true, initialPage: 0);
    PageController page = PageController( viewportFraction: 0.9);

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          // color: Colors.blueGrey,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.5,
          child: PageView.builder(
            itemCount: 5,
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ItemBannerTile(
              );
            },
          ),
        ),
        Positioned(
          top: 370,
          child: SmoothPageIndicator(
            controller: controller,
            count: 3, //banner_list.length,
            effect: SlideEffect(
                paintStyle: PaintingStyle.stroke,
                activeDotColor: AppColor.appColor,
                dotColor: AppColor.appColor,
                dotHeight: 8,
                dotWidth: 8),
          ),
        ),

      ],
    );
  }
}
