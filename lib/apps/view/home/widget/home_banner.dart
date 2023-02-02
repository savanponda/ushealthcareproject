import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/home/tile/BannerTile.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    PageController controller = PageController(viewportFraction: 1, keepPage: true, initialPage: 0);
    PageController page = PageController( viewportFraction: 0.9);

    return Column(
      children: [
        AspectRatio(
          aspectRatio: 5/2.5,
          child: PageView.builder(
            itemCount: 5,
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return BannerTile(
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: controller,
          count: 3, //banner_list.length,
          effect: SlideEffect(
                paintStyle: PaintingStyle.stroke,
                activeDotColor: AppColor.appColor,
                dotColor: AppColor.appColor,
                dotHeight: 8,
                dotWidth: 8),
        )
      ],
    );
  }
}
