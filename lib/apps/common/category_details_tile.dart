import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:onlinebia/style/AppColor.dart';
import '../../helper/AssetsHelper.dart';


class CategoryDetailsTile extends StatelessWidget {

  final String image;
  final String title;
  final double IconHeight;
  final double IconWidth;


  const CategoryDetailsTile({Key? key, required this.image, required this.title, required this.IconHeight, required this.IconWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
          child: Column(
            children: [
              Container(
                height: IconHeight,
                width: IconWidth,
                decoration: BoxDecoration(
                  color: AppColor.appBgGray,
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
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "AppSemiBold",
                  color: Colors.black,
                ),
                //overflow: TextOverflow.ellipsis,
              ),
              // SizedBox(width: 120),
            ],
          ),
        ),
      )
    );
  }
}
