import 'package:flutter/cupertino.dart';
import 'package:UShealthcare/custom/app_loader.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';
import 'package:UShealthcare/style/AppColor.dart';

class PriceCardLoader extends StatefulWidget {
  const PriceCardLoader({Key? key}) : super(key: key);

  @override
  State<PriceCardLoader> createState() => _PriceCardLoaderState();
}

class _PriceCardLoaderState extends State<PriceCardLoader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.2,
      color: AppColor.appBgGray.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLoaders(height: 20, width: 100, radius: 10,reverse: true,),
                AppLoaders(height: 20, width: 50, radius: 10,),
              ],
            ),
            WidgetHelper.getFieldSeparator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLoaders(height: 20, width: 100, radius: 10,),
                AppLoaders(height: 20, width: 50, radius: 10,reverse: true,),
              ],
            ),
            WidgetHelper.getFieldSeparator(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: AppColor.appDivider,
            ),
            WidgetHelper.getFieldSeparator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLoaders(height: 20, width: 50, radius: 10,reverse: true,),
                AppLoaders(height: 20, width: 50, radius: 10,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
