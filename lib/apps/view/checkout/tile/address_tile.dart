import 'package:flutter/material.dart';
import 'package:UShealthcare/helper/AssetsHelper.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';
import 'package:UShealthcare/style/AppColor.dart';

class AddressTile extends StatelessWidget {

  AddressTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text("John Diesel",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "AppBold",
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Image(image: AssetsHelper.getIcon("ic_edit.png"), height: 20, width: 20,),

            ],
          ),
          SizedBox(height: 5,),
          Text("+1 3712 3789",
            style: TextStyle(
              fontSize: 14,
              fontFamily: "AppRegular",
              color: AppColor.appSubTitleText,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text("23rd Street, Zara Circle, Western Railway, UK.",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "AppRegular",
                    color: AppColor.appSubTitleText,
                  ),
                ),
              ),
            ],
          ),
          WidgetHelper.getFieldSeparator(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: AppColor.appColor,width: 1)
            ),
            child: Text("Edit Address",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "AppRegular",
                color: AppColor.appColor,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          WidgetHelper.getFieldSeparator(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: AppColor.appDivider,
          ),

        ],
      ),
    );
  }
}
