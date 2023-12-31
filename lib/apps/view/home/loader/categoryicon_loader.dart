import 'package:flutter/cupertino.dart';
import 'package:UShealthcare/custom/app_loader.dart';

class CategoryIconLoader extends StatelessWidget {
  const CategoryIconLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:  EdgeInsets.symmetric(horizontal: 8,vertical: 5),
        child: Column(

          children: [
            AppLoaders(height: 50, width: 50,reverse: true,radius: 30),
            SizedBox(height: 5,),
            AppLoaders(height: 9, width: 50,radius: 15,),
            SizedBox(height: 5,),

          ],
        ));
  }
}
