import 'package:flutter/material.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/style/AppColor.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({Key? key}) : super(key: key);

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
        padding:  EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Review",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "AppSemiBold",
                      )
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Image(
                            height: 20,
                            width: 20,
                            color: AppColor.appBarText,
                            image: AssetsHelper.getIcon("ic_edit.png"),
                          ),
                          SizedBox(width: 5,),
                          Image(
                            height: 20,
                            width: 20,
                            image: AssetsHelper.getIcon("ic_delete.png"),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 12,),
            Container(
              child: Text("This is the best shop to shopping for Fashion Clothes",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: "AppSemiBold",
                  )
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: Text("John Diesel",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: "AppSemiBold",
                  )
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
