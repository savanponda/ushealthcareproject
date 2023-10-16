import 'package:flutter/cupertino.dart';
import 'package:UShealthcare/custom/app_loader.dart';


class IndicatorLoader extends StatelessWidget {
  const IndicatorLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
              child: AppLoaders(height:8, width: 8,reverse: true,radius: 30),
            ),
          ],
        ));
  }
}
