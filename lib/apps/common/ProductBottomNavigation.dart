import 'package:flutter/material.dart';
import '../../style/AppColor.dart';

class ProductBottomNavigation extends StatelessWidget {
  final Function callback;
  final String BottomButtonTitle1;
  final String BottomButtonTitle2;
  final bool TotalTitle;

  ProductBottomNavigation({Key? key,
    required this.callback,
    required this.BottomButtonTitle1,
    required this.BottomButtonTitle2,
    required this.TotalTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0.5,
              blurRadius: 4,
              offset: Offset(0,-5), // changes position of shadow
            ),]
         ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: TotalTitle?(){}:() => callback(),
              child: Container(
                child: Center(
                    child: TotalTitle?Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text("Total",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "AppSemiBold",
                              )
                          ),
                          SizedBox(height: 5,),
                          Text("#127.00",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "AppBold",
                              )
                          ),
                        ]
                    ):
                    Text(BottomButtonTitle1,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "AppSemiBold",
                        )
                    )
                ),
              ),
            ),
          ),

          Expanded(
            child: GestureDetector(
              onTap: () => callback(),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.appColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0,-5), // changes position of shadow
                      ),]
                ),
                child: Center(
                  child: Text(BottomButtonTitle2,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "AppSemiBold",
                        color: Colors.white
                      )
                  ),
                ),
              ),
            ),
          ),
    ])
    );
  }
}