import 'package:flutter/material.dart';
import 'package:onlinebia/custom/app_loader.dart';

class OrderDetailsListLoader extends StatelessWidget {
  const OrderDetailsListLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
        elevation: 0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppLoaders(height: 80, width: 80, radius: 10),
            SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppLoaders(height: 20, width: 120, radius: 20,reverse: true,),
                  SizedBox(height: 7.5,),
                  AppLoaders(height: 20, width: 90, radius: 20),
                  SizedBox(height: 4.75,),
                  AppLoaders(height: 20, width: 70, radius: 20,reverse: true,),
                ],
              ),
            ),
            AppLoaders(height: 20, width: 20, radius: 20),
          ],
        )
    );
  }
}
