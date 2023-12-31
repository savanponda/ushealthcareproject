import 'package:flutter/material.dart';
import 'package:UShealthcare/helper/AssetsHelper.dart';
import 'package:UShealthcare/style/AppColor.dart';

class jobProfileTile extends StatelessWidget {
  const jobProfileTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 23,right: 23,top:20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15),),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0.5,
            blurRadius: 4,
            offset: Offset(0,0), // changes position of shadow
          ),],
      ),

      child: Row(
        children: [
          SizedBox(width: 10,height: 60,),
          Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.appColor,
            ),
          ),
          SizedBox(width: 9),
          Container(
              decoration: BoxDecoration(
                border:Border.all(width: 1,color: AppColor.notificationBG) ,
                borderRadius: BorderRadius.all(Radius.circular(25),),
                color: AppColor.FieldColor,
              ),
              height:40,
              width:40,
              child: Padding(
                padding:  EdgeInsets.all(10),
                child: Image(
                    color: AppColor.appColor,
                    image: AssetsHelper.getIcon("ic_notification_icon.png")),
              )
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "UShealthcare Sale Arrival Hurry Up! Get Your Product in Cheapest Rate!",
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 0.05,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12,),
          Text("1hr", style: TextStyle(color: AppColor.appSubTitleText,letterSpacing: 0.5),),
          SizedBox(width: 13,)
        ],
      ),
    );
  }
}
