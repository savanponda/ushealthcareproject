import 'package:flutter/material.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';

class PromoCodeTile extends StatelessWidget {
  bool removeButton=false;

  PromoCodeTile({Key? key,required this.removeButton}) : super(key: key);

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
                                    height:15,
                                    width:15,
                                      child: Image(
                                          image: AssetsHelper.getIcon("ic_promo_code.png"))
                                  ),
                                  SizedBox(width: 10),
                                 Text(buildTranslate(context, "promoApplied"),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "AppSemiBold",
                                      color: AppColor.FieldTextColor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ]
                            ),
                          ),
                          removeButton?Text(buildTranslate(context, "remove"),
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "AppMedium",
                                color: AppColor.appColor
                            ),
                          ):Text(buildTranslate(context, "apply"),
                            style: TextStyle(
                                fontSize: 14,
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
                            child: Text(buildTranslate(context, "promoDes"),
                              style: TextStyle(
                                fontSize: 12,
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
