import 'package:flutter/material.dart';
import 'package:onlinebia/custom/app_loader.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';

class OrderInfoListLoader extends StatelessWidget {
  int? index;
  bool? orderheader;
   OrderInfoListLoader({Key? key,this.index,this.orderheader}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        index==0?AppLoaders(height: 20, width: 80, radius: 20):
        SizedBox(height: 10,),
        Container(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  index==0?Container():
                  WidgetHelper.getDivider(width: MediaQuery.of(context).size.width),
                  SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        child:AppLoaders(height: 80, width: 80, radius: 10,reverse: true,),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            AppLoaders(height: 20, width: 50, radius: 20),

                            SizedBox(height: 10,),
                            Row(
                              children: [
                                AppLoaders(height: 20, width: 100, radius: 20,reverse: true,),
                                SizedBox(width: 15,),

                              ],
                            ),
                            SizedBox(height: 10,),
                            AppLoaders(height: 20, width: 100, radius: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
