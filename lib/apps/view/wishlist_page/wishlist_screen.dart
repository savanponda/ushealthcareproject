import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/wishlist_page/widget/product_card_wishlist.dart';

import '../../../../helper/WidgetHelper.dart';
import '../../../../localization/AppLocalizations.dart';
class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: WidgetHelper.getHeader(
            context,
            buildTranslate(context, "fashion"),
            showBackIcon: true,
            showNotificationIcon: false,
            centerTitle: true,
            onAddressClick: (){
              // NavigatorHelper.remove();
            }
        ),
        body: Container(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  WidgetHelper.getFieldSeparator(),
                  ProductCardWishList()
                ],
              ),
            ),
          ),
        )
    );
  }
}
