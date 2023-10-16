import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/view/payment/my_payment/tile/PaymentCardListTile.dart';


class MyCardList extends StatelessWidget {
  MyCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: 2,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return PaymentCardListTile(index:index);
      },
    );
  }
}
