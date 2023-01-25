import 'package:flutter/material.dart';
import 'package:onlinebia/style/AppColor.dart';

import '../../helper/AssetsHelper.dart';
import '../../helper/NavigatorHelper.dart';
import '../../localization/AppLocalizations.dart';
import '../view/product_detail/product_detail_page.dart';

class ProductTile extends StatelessWidget {
  final bool buttonLiked;
  const ProductTile({Key? key, required this.buttonLiked }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        NavigatorHelper.add(ProductDetailPage());
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children:[
                ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image(
                  image: AssetsHelper.getImage("product.png"),
                ),
              ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColor.Buttontext,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Image(
                        image: buttonLiked?AssetsHelper.getIcon("ic_trash_colored.png"):AssetsHelper.getIcon("ic_heart_filled.png"),
                      ),
                    ),
                  ),
                )
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 5),
              child: Text(buildTranslate(context, "warmersSweater"),),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: buildTranslate(context, "price"), style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "AppRegular"
                    ),),
                    TextSpan(
                      text: buildTranslate(context, "priceTwo"), style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "AppRegular"
                    ),),
                  ],
                ),

              ),
            ),
              ],
            ),

        ),
           );
  }
}