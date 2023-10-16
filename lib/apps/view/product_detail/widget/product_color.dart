import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/view/product_detail/tile/color_item_tile.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';
import 'package:UShealthcare/style/AppColor.dart';

class ProductColor extends StatefulWidget {
  const ProductColor({Key? key}) : super(key: key);

  @override
  State<ProductColor> createState() => _ProductColorState();
}

class _ProductColorState extends State<ProductColor> {
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
              child: Text("Color",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "AppBold",
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Container(
          height: 25,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ColorItemTile(
                index: index,
              );
            },
          ),
        ),
        WidgetHelper.getFieldSeparator(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: AppColor.appDivider,
        )
      ],
    ));
  }
}
