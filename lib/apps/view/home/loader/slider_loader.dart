import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/custom/app_loader.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';

import 'indicator_loader.dart';

class SliderLoader extends StatelessWidget {
  const SliderLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            WidgetHelper.getFieldSeparator(),
            AspectRatio(
              aspectRatio: 5/2.5,
              child: AppLoaders(height: 0, width: 40, radius: 15,),
            ),
            WidgetHelper.getFieldSeparator(),
            Container(
              height: 20,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return IndicatorLoader(
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
