import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/menu/bottom_BarScreen.dart';
import 'package:onlinebia/style/AppColor.dart';

import '../../../custom/TextView.dart';
import '../../../helper/AssetsHelper.dart';
import '../../../helper/NavigatorHelper.dart';
import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';
import '../../../style/Fonts.dart';
import '../../tiles/OrderInfoTile.dart';
import '../../tiles/ProductBottomNavigation.dart';
import '../../tiles/PromoCodeTile.dart';
import 'PromoCodeScreen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  TextEditingController promoCodeIC = TextEditingController();
  FocusNode promoCodeNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: WidgetHelper.getHeader(
          context,
          buildTranslate(context, "myPayment"),
          showFilterIcon: true,
          showNotificationIcon: false,
          centerTitle: true,
          shownotificationIcon: true,
          showIcon: true,
          showBackIcon: true,
          onAddressClick: (){
            // NavigatorHelper.remove();
          }
      ),

      body:  Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                              image: AssetsHelper.getImage('thumnail.png') ,
                            fit: BoxFit.fill
                          )
                        ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("HDFC",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "AppSemiBold",
                              color: Colors.black,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10,),
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "**** **** **** ", style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "AppSemiBold",
                                  color: AppColor.appSubTitleText,
                                ),),
                                TextSpan(
                                  text: "10234", style: TextStyle(
                                    color: AppColor.appSubTitleText,
                                    fontSize: 18,
                                    fontFamily: "AppSemiBold"
                                ),),
                              ],
                            ),
                          ),
                          Text("John Diesel",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "AppSemiBold",
                              color: AppColor.appSubTitleText,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            color: AppColor.appDivider,
                          ),
                        ],),
                    ),
                  ],),
              ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                                image: AssetsHelper.getImage('thumnail.png') ,
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("HDFC",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "AppSemiBold",
                                color: Colors.black,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 10,),
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "**** **** **** ", style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "AppSemiBold",
                                    color: AppColor.appSubTitleText,
                                  ),),
                                  TextSpan(
                                    text: "10234", style: TextStyle(
                                      color: AppColor.appSubTitleText,
                                      fontSize: 18,
                                      fontFamily: "AppSemiBold"
                                  ),),
                                ],
                              ),
                            ),
                            Text("John Diesel",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "AppSemiBold",
                                color: AppColor.appSubTitleText,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              color: AppColor.appDivider,
                            ),
                          ],),
                      ),
                    ],),
                ),

              ],),
          ),
        ),
      )
    );
  }
}
