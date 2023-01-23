import 'package:flutter/material.dart';
import 'package:onlinebia/custom/app_loader.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';

class ProductLoader extends StatelessWidget {
  const ProductLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
              children:[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: AppLoaders(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.5,
                    radius: 10,reverse: true,)
                ),
              ]),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                AppLoaders(height: 10, width: 100, radius: 10,),
              ],
            )
          ), Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              children: [
                AppLoaders(height: 10, width: 70, radius: 10,reverse: true,)
              ],
            )

          ),
          WidgetHelper.getFieldSeparator()
        ],
      ),

    );
  }
}
