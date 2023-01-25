import 'package:flutter/cupertino.dart';
import 'package:onlinebia/custom/app_loader.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/style/AppColor.dart';

class MyAddressPageLoader extends StatelessWidget {
  const MyAddressPageLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
             AppLoaders(height: 20, width: 100, radius: 10)
            ],
          ),
          SizedBox(height: 5,),
          AppLoaders(height: 20, width: 100, radius: 10,reverse: true,),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child:  AppLoaders(height: 20, width: 50, radius: 10)
              ),
            ],
          ),
          WidgetHelper.getFieldSeparator(),
          WidgetHelper.getFieldSeparator(height: 10),
          Container(
            child: AppLoaders(height: 25, width: 100, radius: 7,reverse: true,)
          ),
          WidgetHelper.getFieldSeparator(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: AppColor.appDivider,
          ),
        ],
      ),
    );
  }
}
