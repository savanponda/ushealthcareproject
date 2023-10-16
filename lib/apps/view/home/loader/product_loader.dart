import 'package:flutter/material.dart';
import 'package:UShealthcare/custom/app_loader.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';

class ProductLoader extends StatelessWidget {
  const ProductLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 30,
        children: [
          for(int index=0;index<6;index++)
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      child: AppLoaders(
                        height: 180,
                        width: MediaQuery.of(context).size.width*0.5,
                        radius: 10,reverse: true,)
                  ),
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

            ),
        ],

      ),
    );
  }
}
