import 'package:flutter/cupertino.dart';
import 'package:onlinebia/custom/app_loader.dart';

class CategoryPageLoader extends StatelessWidget {
  const CategoryPageLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 3.5,vertical: 5),
              child: AppLoaders(height: 60, width: 60,reverse: true,radius: 30),
            ),
            AppLoaders(height: 9, width: 50,radius: 15,),
          ],
        ));
  }
}
