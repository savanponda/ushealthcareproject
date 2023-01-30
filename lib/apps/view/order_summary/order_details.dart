import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/order_summary/tile/address_deliver_time.dart';
import 'package:onlinebia/apps/view/order_summary/tile/review_tile.dart';
import 'package:onlinebia/apps/view/order_summary/widget/order_summary_info.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetHelper.getHeader(
          context,
          buildTranslate(context, "myProfil"),
          centerTitle: true,
          showBackIcon: true,
          showNotificationIcon: false,
          onAddressClick: (){
          }
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                child: AddressAndDeliverTimeTile(Title: 'Estimated Arrival', SubTitle: 'Friday, 13th January, 2023', Description: 'Processing Your Order', image: true,),
            ),
            Container(
              child: AddressAndDeliverTimeTile(Title: 'Deliver to', SubTitle: '23rd Street, Zara Circle, Western Railway, UK.', Description: 'John Diesel  8975412650', image: false,),
            ),
            Padding(
              padding: EdgeInsets.all(20),
                child: OrderSummaryInfo(),
            ),
            Container(
              child: ReviewTile(),
            )
          ],
        ),
      ),
    );
  }
}
