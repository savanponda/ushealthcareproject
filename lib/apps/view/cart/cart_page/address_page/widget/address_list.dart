import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/cart/checkout_page/tile/address_tile.dart';

class AddressList extends StatelessWidget {
  AddressList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      child:  Center(
        child: Wrap(
          spacing: MediaQuery.of(context).size.width*0.09,
          alignment: WrapAlignment.start,
          children: [
            for(int index=0;index<2;index++)
              AddressTile()
          ],
        ),
      ),
    );
  }
}
