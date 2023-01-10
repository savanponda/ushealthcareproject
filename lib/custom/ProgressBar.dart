import 'package:flutter/material.dart';

import '../style/AppColor.dart';

class ProgressBar extends StatelessWidget {

  const ProgressBar({
    Key? key,
    required this.title,
    required this.index,
    this.dotIndicator,
    this.color,
    this.textColor,
    this.textSize,
    this.radius,
    this.lineColor,
    this.dotIndicatorColor,

  }) : super(key: key);

  final String title;
  final int? dotIndicator;
  final int index;
  final Color? textColor;
  final Color? color;
  final double? textSize;
  final double? radius;
  final Color? lineColor;
  final Color? dotIndicatorColor;

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        //color: Colors.greenAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            index==0?
            Row(
              children: [
                Text(index==0?"Placed":index==1?"Processing":index==2?"On Pickup":"Completed",
                  style: TextStyle(
                      fontSize: 10
                  ),

                ),
                Expanded(
                  child: Container(
                    height: 2,
                  ),
                ),
              ],
            ):
            index==3?
            Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 2,
                      ),
                    ),
                    Text(index==0?"Placed":index==1?"Processing":index==2?"On Pickup":"Completed",
                      style: TextStyle(
                          fontSize: 10
                      ),

                    ),

                  ],
                ):
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 2,
                  ),
                ),
                Text(index==0?"Placed":index==1?"Processing":index==2?"On Pickup":"Completed",
                  style: TextStyle(
                    fontSize: 10
                  ),

                ),
                Expanded(
                  child: Container(
                    height: 2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),



            index==0?
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    height: 10,
                    width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index!=3?AppColor.appColor:AppColor.appDivider,
                  ),
                  ),
                index==3?
                Container():
                Expanded(
                  child: Container(
                    height: 2,
                    color: index!=2?AppColor.appColor:AppColor.appDivider,
                  ),
                ),


              ],
            ):
            index==3?
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 2,
                    color: index!=3?AppColor.appColor:AppColor.appDivider,
                  ),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index!=3?AppColor.appColor:AppColor.appDivider,
                  ),
                ),
              ],
            ):
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 2,
                    color: index!=3?AppColor.appColor:AppColor.appDivider,
                  ),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index!=3?AppColor.appColor:AppColor.appDivider,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 2,
                    color: index!=3?AppColor.appColor:AppColor.appDivider,
                  ),
                ),


              ],
            )

          ],
        ),
      ),
    );
  }
}