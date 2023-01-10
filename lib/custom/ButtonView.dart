import 'package:flutter/material.dart';
import '../helper/AssetsHelper.dart';
import '../style/AppColor.dart';
import '../style/Fonts.dart';

class ButtonView extends StatelessWidget {

  const ButtonView({
    Key? key,
    required this.buttonTextName,
    required this.onPressed,
    this.color,
    this.textColor,
    this.borderColor,
    this.padding,
    this.textSize,
    this.radius,
    this.iconData,
    this.iconShare=false,
  }) : super(key: key);

  final String buttonTextName;
  final Function onPressed;
  final Color? textColor;
  final Color? color;
  final Color? borderColor;
  final EdgeInsets? padding;
  final double? textSize;
  final double? radius;
  final bool? iconData;
  final bool? iconShare;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        decoration: BoxDecoration(
          color: color??AppColor.appButton,
          borderRadius: BorderRadius.circular(radius??10),
          //border: Border.all(color: borderColor??AppColor.appGrayTextColor, width: 0.7),
          // boxShadow: [
          //   // BoxShadow(
          //   //   color: AppColor.appColor.withOpacity(0.2),
          //   //   spreadRadius: 1,
          //   //   blurRadius: 3,
          //   //   offset: Offset(0,2), // changes position of shadow
          //   // ),
          // ],
        ),
        padding: EdgeInsets.all(20),
       // margin: EdgeInsets.only(right: 28, left: 28),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 8,),
            iconShare==false?Container():Image(
              image: AssetsHelper.getIcon("ic_share.png",),
              height: 20,
              width: 20,
            ),
            iconShare==true?
            SizedBox(width: 8,):Container(),
            Flexible(
              child: Text(
                buttonTextName,
                style: Fonts.buttonStyle.copyWith(
                    color: textColor??Colors.white,
                    fontSize: textSize??16,
                  fontWeight: FontWeight.w700
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(width: 8,),
            iconData==false?Container():Image(
              image: AssetsHelper.getIcon("ic_nextbtn.png",),
              height: 20,
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}