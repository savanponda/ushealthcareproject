import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/menu/bottom_BarScreen.dart';
import 'package:onlinebia/style/AppColor.dart';

import '../../../custom/ButtonView.dart';
import '../../../helper/NavigatorHelper.dart';
import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';
import '../../tiles/PaymentCardListTile.dart';
import 'AddressScreen.dart';

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
                ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return PaymentCardListTile();
                  },
                ),

                ButtonView(
                  color: AppColor.appColor,
                  textColor: AppColor.Buttontext,
                  borderColor:AppColor.appBarText,
                  textSize: 16,
                  radius: 30,
                  iconData: false,
                  onPressed: () {
                    //Scaffold.of(context).hideCurrentSnackBar();
                    NavigatorHelper.add(AddressScreen());
                  },
                  buttonTextName: buildTranslate(context, "continue"),
                ),


              ],),
          ),
        ),
      )
    );
  }
}
