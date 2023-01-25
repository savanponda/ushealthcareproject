import 'package:flutter/cupertino.dart';

import '../../../custom/app_loader.dart';

class IndicatorLoader extends StatelessWidget {
  const IndicatorLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
              child: AppLoaders(height:10, width: 10,reverse: true,radius: 30),
            ),
          ],
        ));
  }
}
