import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/view/product_detail/tile/size_item_tile.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';
import 'package:UShealthcare/style/AppColor.dart';

class ProductSize extends StatefulWidget {
  const ProductSize({Key? key}) : super(key: key);

  @override
  State<ProductSize> createState() => _ProductSizeState();
}

class _ProductSizeState extends State<ProductSize> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(buildTranslate(context, "size"),
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "AppBold",
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(buildTranslate(context, "sizeGuide"),
              style: TextStyle(
                fontSize: 14,
                fontFamily: "AppMedium",
                color: AppColor.appColor,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(width: 10,),

          ],
        ),
        SizedBox(height: 10,),

        Container(
          height: 25,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return SizeItemTile(
                index: index,
              );
            },
          ),
        ),
        SizedBox(height: 12,),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: AppColor.appDivider,
        )
      ],
    ));
  }
}
