import 'package:flutter/cupertino.dart';
import 'package:UShealthcare/custom/app_loader.dart';

class CategoryPageLoader extends StatelessWidget {
  const CategoryPageLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Wrap(
            spacing: MediaQuery.of(context).size.width*0.09,
            alignment: WrapAlignment.start,
            runSpacing: 30,
            children: [
              for(int index=0;index<11;index++)
                Container(
                  padding:  EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                  child: Column(
                    children: [
                      AppLoaders(height: 70, width: 70,reverse: true,radius: 50),
                      SizedBox(height:5,),
                      AppLoaders(height: 9, width: 50,radius: 15,),
                      SizedBox(height: 5,),
                    ],
                  ),
                )
            ]
        )
    );
  }
}
