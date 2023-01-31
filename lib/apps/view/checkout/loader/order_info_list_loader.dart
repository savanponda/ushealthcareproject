import 'package:flutter/material.dart';
import 'package:onlinebia/custom/app_loader.dart';

class OrderInfoListLoader extends StatelessWidget {
  const OrderInfoListLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppLoaders(height: 20, width:80, radius: 20,reverse: true,),
        Wrap(
          spacing: MediaQuery.of(context).size.width*0.09,
          alignment: WrapAlignment.start,
          children: [
            for(int index=0;index<2;index++)
            Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppLoaders(height: 80, width: 80, radius: 20,),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppLoaders(height: 20, width: 50, radius: 20,reverse: true,),
                            SizedBox(height: 10,),
                            AppLoaders(height: 20, width: 100, radius: 20,),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
        ],),
      ],
    );
  }
}
