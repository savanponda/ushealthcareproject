import 'package:flutter/material.dart';
import 'package:UShealthcare/style/AppColor.dart';

class SizeItemTile extends StatelessWidget {
  int? index;
  SizeItemTile({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(right: 10),
      child: Container(
        height: 25,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(5),),
          border: Border.all(color:index==1?AppColor.appColor:AppColor.appDivider, width: 1),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: index==0?Text("S",
                      style: TextStyle(
                fontSize: 13,
                fontFamily: "AppSemiBold",
                color: Colors.black,
              ),):
                    index==1?Text("M",
                      style: TextStyle(
                fontSize: 13,
                fontFamily: "AppSemiBold",
                color: Colors.black,
              ),):
                    index==2?Text("L",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: "AppSemiBold",
                        color: Colors.black,
                      ),):
                    index==3?Text("XL",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: "AppSemiBold",
                        color: Colors.black,
                      ),):
                    index==4?Text("XXL",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: "AppSemiBold",
                        color: Colors.black,
                      ),):
                    Text("XXL",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: "AppSemiBold",
                        color: Colors.black,
                      ),)

          ),
        ),
      ),
    );
  }
}
