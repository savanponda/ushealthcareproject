import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/product_tile.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';


class SimilarProduct extends StatefulWidget {
  const SimilarProduct({Key? key}) : super(key: key);

  @override
  State<SimilarProduct> createState() => _SimilarProductState();
}

class _SimilarProductState extends State<SimilarProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(buildTranslate(context, "similarProduct"),
          style: TextStyle(
            fontSize: 18,
            fontFamily: "AppSemiBold",
            color: Colors.black,
          ),
        ),

        WidgetHelper.getFieldSeparator(),
        Center(
          child: Wrap(
            spacing: 30,
            children: [
              for(int index=0;index<5;index++)
                ProductTile(likedIcon: true,)
            ],
          ),
        ),
        WidgetHelper.getFieldSeparator(),

      ],
    ));
  }
}
