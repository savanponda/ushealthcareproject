import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/order_summary/widget/order_summary_modal.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/style/AppColor.dart';

class ProductDetailsTile extends StatelessWidget {
  const ProductDetailsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){
        showModalBottomSheet(
            isDismissible: false, // offline-swipable
            context: context,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Container(
                  height: 415,
                  child: Container(
                      decoration: BoxDecoration(
                          color: AppColor.appWhite,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: Container(
                        child: OrderSummaryModal(),
                      )
                  ),
                ),
              );
            });
      },
      child: Card(
          elevation: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 80,
                  width: 80,
                  child: Image(image: AssetsHelper.getImage('thumnail.png'))
              ),
              SizedBox(width: 20,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("T-Shirt",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "AppSemiBold",
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 7.5,),
                    Text("\$65",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "AppBold",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4.75,),
                    Text("Size : L",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "AppSemiBold"
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 20,
                width: 20,
                child: Image(
                  height: 20,
                  width: 20,
                  color: AppColor.appBarText,
                  image: AssetsHelper.getIcon("ic_arrow_forwarded.png"),
                )
              )
            ],
          )
      ),
    );
  }
}
