import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/bottom_button_view.dart';
import 'package:onlinebia/apps/common/product_bottom_navigation.dart';
import 'package:onlinebia/apps/view/address/my_address_page/my_address_page.dart';
import 'package:onlinebia/apps/view/payment/my_payment/widget/my_card_list.dart';
import 'package:onlinebia/style/AppColor.dart';

import '../../../../custom/ButtonView.dart';
import '../../../../helper/NavigatorHelper.dart';
import '../../../../helper/WidgetHelper.dart';
import '../../../../localization/AppLocalizations.dart';
import '../add_new_card/add_new_card.dart';
import 'tile/PaymentCardListTile.dart';

class MyPaymentPage extends StatefulWidget {
  const MyPaymentPage({Key? key}) : super(key: key);

  @override
  State<MyPaymentPage> createState() => _MyPaymentPageState();
}

class _MyPaymentPageState extends State<MyPaymentPage> {

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
          shownotificationIcon: false,
          showIcon: true,
          showBackIcon: true,
          showaddIcon: true,
          onAddIconClick: (){
            NavigatorHelper.add(AddNewCardPage());
          },
          onAddressClick: (){
            // NavigatorHelper.remove();
          }
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyCardList(),
            ],),
        ),
      ),
      bottomNavigationBar: BottomButtonView(
        ButtonTitle: 'makePayment',
        deSelect: false,

        callback: (){
        NavigatorHelper.add(MyAddressPage());
      },),
          );
  }
}
