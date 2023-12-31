import 'package:flutter/material.dart';
import 'package:UShealthcare/helper/AssetsHelper.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';
import 'package:UShealthcare/style/AppColor.dart';

class PromoCodeTile extends StatelessWidget {
  bool removeButton=false;
  final Function callBack;
  PromoCodeTile({Key? key,required this.removeButton,required this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10),),
            border: Border.all(color:AppColor.appBgGray, width: 1),
          ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
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
                            InkWell(
                              splashColor: Colors.transparent,
                              onTap: () => callBack(),
                              child: Padding(
                                padding: EdgeInsets.only(right:15 ),
                                child: Text(buildTranslate(context, removeButton?"remove":"apply"),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "AppMedium",
                                      color: AppColor.appColor
                                  ),
                                ),
                              ),
                            )
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
      ),
    );
  }
}
