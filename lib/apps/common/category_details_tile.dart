
import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/search/search_main.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:onlinebia/style/Fonts.dart';


class CategoryDetailsTile extends StatelessWidget {

  final String image;
  final String title;
  final double IconHeight;
  final double IconWidth;


  const CategoryDetailsTile({Key? key,
    required this.image,
    required this.title,
    required this.IconHeight,
    required this.IconWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){
        NavigatorHelper.add(SearchScreen());
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            height: IconHeight,
            width: IconWidth,
            decoration: BoxDecoration(
              color: AppColor.ButtonDeSelectbgcolor,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image(
                image: AssetsHelper.getIcon(image),
              ),
            ),
          ),
          SizedBox(height: 5,),
          Text(title,
            style: Fonts.productDetailtStyle.copyWith(
              fontWeight: FontWeight.w500
            )
            //overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
