import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/view/product_detail/product_detail_page.dart';
import 'package:UShealthcare/helper/AssetsHelper.dart';
import 'package:UShealthcare/helper/NavigatorHelper.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';
import 'package:UShealthcare/style/AppColor.dart';
import 'package:UShealthcare/style/Fonts.dart';


class ProductTile extends StatelessWidget {
  bool likedIcon;
  bool trashIcon;
  ProductTile({Key? key, required this.likedIcon,  this.trashIcon=false }) : super(key: key);

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
                        image: trashIcon?AssetsHelper.getIcon("ic_trash_colored.png"):
                        likedIcon?AssetsHelper.getIcon("ic_heart_filled.png"):
                        AssetsHelper.getIcon("ic_heart.png"),
                      ),
                    ),
                  ),
                )
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 5),
              child: Text(buildTranslate(context, "warmersSweater"),
                style: Fonts.productDetailtStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                    Text(buildTranslate(context, "price"),
                      style: Fonts.appBottomTitle.copyWith(
                          fontSize: 11,
                          color: AppColor.strikedText,
                      ),
                    ),
                    SizedBox(width: 12,),
                    Text(buildTranslate(context, "priceTwo"),
                      style: Fonts.productDetailtStyle.copyWith(
                          color: AppColor.appColor),
                     ),
                  ],
                ),
              ),

              ]),

        ),
      );
  }
}


