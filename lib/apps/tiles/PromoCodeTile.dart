import 'package:flutter/material.dart';
import '../../helper/AssetsHelper.dart';
import '../../style/AppColor.dart';

class PromoCodeTile extends StatelessWidget {

  PromoCodeTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10),),
          border: Border.all(color:AppColor.appBgGray, width: 1),
        ),
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                        Expanded(
                        child: Row(
                           children: [
                             Container(
                                    height:20,
                                    width:20,
                                      child: Image(
                                          image: AssetsHelper.getIcon("ic_promo_code.png"))
                                  ),
                                  SizedBox(width: 10),
                                  Text("PRM2023",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "AppSemiBold",
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ]
                            ),
                          ),
                          Text("Apply",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "AppMedium",
                              color: AppColor.appColor
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: Text("20% Off on All Shopping Items",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "AppSemiBold",
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
