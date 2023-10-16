import 'package:flutter/material.dart';
import 'package:UShealthcare/custom/app_loader.dart';

class ReviewPageLoader extends StatelessWidget {
  const ReviewPageLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white,
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(horizontal: 21),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          AppLoaders(height: 20, width: 150, radius: 20),
                          SizedBox(width: 5,),

                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          AppLoaders(height: 20, width: 20, radius: 10),
                          SizedBox(width: 5,),
                          AppLoaders(height: 20, width: 20, radius: 10)
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 12,),
            Container(
                child: AppLoaders(height: 20, width: 200, radius: 20)
            ),
            SizedBox(height: 10,),
            Container(
                child: AppLoaders(height: 20, width: 80, radius: 20)
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}