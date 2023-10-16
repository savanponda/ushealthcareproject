import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:UShealthcare/apps/common/bottom_button_view.dart';
import 'package:UShealthcare/apps/view/address/my_address_page/my_address_page.dart';
import 'package:UShealthcare/apps/view/payment/my_payment/my_payment_page.dart';
import 'package:UShealthcare/helper/NavigatorHelper.dart';
import 'package:UShealthcare/helper/ValidationHelper.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';
import 'package:UShealthcare/style/InputDecoration.dart';

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
                    TextFormField(
                      focusNode: cardNumberNode,
                      controller: cardNumberIC,
                      decoration:CustomInputDecoration.getInputDecoration(
                        hintText: buildTranslate(context, "cardNumber"),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(100)],
                      validator: (value) =>ValidationHelper.checkBlankValidation(context,value,"value",),
                      textInputAction: TextInputAction.next,
                    ),

                    WidgetHelper.getFieldSeparator(),
                    TextFormField(
                      focusNode: cardNameNode,
                      controller: cardNameIC,
                      decoration:CustomInputDecoration.getInputDecoration(
                        hintText: buildTranslate(context, "cardName"),
                      ),
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      inputFormatters: [LengthLimitingTextInputFormatter(100)],
                      validator: (value) =>ValidationHelper.checkBlankValidation(context,value,"value",),
                      textInputAction: TextInputAction.next,
                    ),

                    WidgetHelper.getFieldSeparator(),

                    TextFormField(
                      focusNode: holderNameNode,
                      controller: holderNameIC,
                      decoration:CustomInputDecoration.getInputDecoration(
                        hintText: buildTranslate(context, "holderName"),
                      ),
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      inputFormatters: [LengthLimitingTextInputFormatter(100)],
                      validator: (value) =>ValidationHelper.checkBlankValidation(context,value,"value",),
                      textInputAction: TextInputAction.next,
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
                              TextFormField(
                                focusNode: expiredNode,
                                controller: expiredIC,
                                decoration:CustomInputDecoration.getInputDecoration(
                                  hintText: buildTranslate(context, "mm/yy"),
                                ),
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                inputFormatters: [LengthLimitingTextInputFormatter(100)],
                                validator: (value) =>ValidationHelper.checkBlankValidation(context,value,"value",),
                                textInputAction: TextInputAction.next,
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
                              TextFormField(
                                focusNode: cvvNode,
                                controller: cvvIC,
                                decoration:CustomInputDecoration.getInputDecoration(
                                  hintText: buildTranslate(context, "cvv"),
                                ),
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                inputFormatters: [LengthLimitingTextInputFormatter(100)],
                                validator: (value) =>ValidationHelper.checkBlankValidation(context,value,"value",),
                                textInputAction: TextInputAction.done,
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
