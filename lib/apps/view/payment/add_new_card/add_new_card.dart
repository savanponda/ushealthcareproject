import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/bottom_button_view.dart';
import 'package:onlinebia/apps/view/address/my_address_page/my_address_page.dart';
import 'package:onlinebia/apps/view/payment/my_payment/my_payment_page.dart';
import 'package:onlinebia/custom/TextView.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';

class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({Key? key}) : super(key: key);

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  TextEditingController cardNumberIC = TextEditingController();
  TextEditingController cardNameIC = TextEditingController();
  TextEditingController holderNameIC = TextEditingController();
  TextEditingController expiredIC = TextEditingController();
  TextEditingController cvvIC = TextEditingController();
  FocusNode cardNumberNode = FocusNode();
  FocusNode cardNameNode = FocusNode();
  FocusNode holderNameNode = FocusNode();
  FocusNode expiredNode = FocusNode();
  FocusNode cvvNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: WidgetHelper.getHeader(
            context,
            buildTranslate(context, "addNewCard"),
            showFilterIcon: true,
            showNotificationIcon: false,
            centerTitle: true,
            shownotificationIcon: false,
            showIcon: true,
            showBackIcon: true,
            showaddIcon: true,
            onAddIconClick: (){
              NavigatorHelper.add(MyPaymentPage());
            },
            onAddressClick: (){
              // NavigatorHelper.remove();
            }
        ),

        body:  Container(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    WidgetHelper.getFieldSeparator(),
                    TextView(
                      focusNode: cardNumberNode,
                      controller: cardNumberIC,
                      label: buildTranslate(context, "cardNumber"),
                      // phoneIcon: true,
                      mobileValidator: true,
                      textInputAction: true,
                      textCapitalization: true,
                      keyboardTypeNumber: true,
                      inputFormatters: true,
                    ),
                    WidgetHelper.getFieldSeparator(),
                    TextView(
                      focusNode: cardNameNode,
                      controller: cardNameIC,
                      // assetIcon:'Phone-Icon.png',
                      label: buildTranslate(context, "cardName"),
                      //phoneIcon: true,
                      obscureText: false,
                      textInputAction: true,
                      textCapitalization: true,
                      inputFormatters: true,
                    ),
                    WidgetHelper.getFieldSeparator(),
                    TextView(
                      focusNode: holderNameNode,
                      controller: holderNameIC,
                      // assetIcon:'Phone-Icon.png',
                      label: buildTranslate(context, "holderName"),
                      //phoneIcon: true,
                      obscureText: false,
                      textInputAction: true,
                      textCapitalization: true,
                      inputFormatters: true,
                    ),
                    WidgetHelper.getFieldSeparator(),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(buildTranslate(context, 'expired'),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: "AppMedium",
                                    )
                                ),
                              ),
                              SizedBox(height: 10,),
                              TextView(
                                focusNode: expiredNode,
                                controller: expiredIC,
                                // assetIcon:'Phone-Icon.png',
                                label: buildTranslate(context, "mm/yy"),
                                //phoneIcon: true,
                                obscureText: false,
                                textInputAction: true,
                                textCapitalization: true,
                                inputFormatters: true,
                              ),

                            ],
                          ),
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(buildTranslate(context, 'cvv'),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: "AppMedium",
                                    )
                                ),
                              ),
                              SizedBox(height: 10,),
                              TextView(
                                focusNode: cvvNode,
                                controller: cvvIC,
                                // assetIcon:'Phone-Icon.png',
                                label: buildTranslate(context, "cvv"),
                                //phoneIcon: true,
                                obscureText: false,
                                textInputAction: true,
                                textCapitalization: true,
                                inputFormatters: true,
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),

                  ],),
              ),
            ),
          ),
        ),
      bottomNavigationBar: BottomButtonView(
        ButtonTitle: 'addCard',
        deSelect: true,
        callback: (){
          NavigatorHelper.add(MyAddressPage());
        },),
    );
  }
}
