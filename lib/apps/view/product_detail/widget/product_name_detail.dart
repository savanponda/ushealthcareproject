import 'package:flutter/material.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/style/AppColor.dart';


class ProductNameDetail extends StatelessWidget {
  ProductNameDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text("Women's Blezer",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "AppBold",
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                  height: 30, width: 30,
                  decoration: BoxDecoration(
                      color: AppColor.FieldColor,
                      shape: BoxShape.circle
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Image(
                      image: AssetsHelper.getIcon("ic_share.png"),),
                  )
              ),
              SizedBox(width: 10,),
              Container(
                  height: 30, width: 30,
                  decoration: BoxDecoration(
                      color: AppColor.FieldColor,
                      shape: BoxShape.circle
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Image(
                      image: AssetsHelper.getIcon("ic_heart_filled.png"),),
                  )
              ),

            ],
          ),
          SizedBox(height: 20,),

          Row(
            children: [
              Text("#45",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "AppBold",
                  color: Colors.black,
                ),),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 4),
                child: Image(
                  height: 20, width: 20,
                  image: AssetsHelper.getIcon("ic_star.png"),),
              ),
              Text("4.0 (7)",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "AppRegular",
                  color: AppColor.appSubTitleText,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(width: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Image(
                  height: 20, width: 20,
                  image: AssetsHelper.getIcon("ic_buy.png"),),
              ),
              Text("85 Sold",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "AppRegular",
                  color: AppColor.appSubTitleText,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          WidgetHelper.getFieldSeparator(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: AppColor.appDivider,
          )
        ],
      ),
    );
  }
}
