import 'dart:async';
import 'package:flutter/material.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:onlinebia/style/Fonts.dart';
enum AnimatedButtonStatus{
  NORMAL,
  DISABLE,
  LOADING,
  COMPLETED,
  ERROR,
}

class AnimatedButton extends StatelessWidget {
  final String? text;
  final Function? onClick;
  final AnimatedButtonStatus status;
  final Color? backgroundColor;
  final Color? textColor;


  const AnimatedButton({
    Key? key,
    this.text,
    this.onClick,
    this.status = AnimatedButtonStatus.NORMAL,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(status != AnimatedButtonStatus.LOADING && status != AnimatedButtonStatus.DISABLE)
          onClick!();
      },
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: getButtonBackground(),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child:
          status == AnimatedButtonStatus.LOADING ?
          SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: getButtonTextColor(),
              strokeWidth: 1,
            ),
          ) :
          status == AnimatedButtonStatus.COMPLETED ?
          Icon(Icons.done, color: getButtonTextColor(),) :
          status == AnimatedButtonStatus.ERROR ?
          Icon(Icons.error, color: getButtonTextColor(),) :
          Text(
            text ?? '',
            style: Fonts.buttonStyle,
          ),
        ),
      ),
    );
  }

  Color? getButtonBackground(){

    if(backgroundColor!=null)
      return backgroundColor;

    if(status == AnimatedButtonStatus.NORMAL)
      return AppColor.appColorLight;
    else if(status == AnimatedButtonStatus.LOADING)
      return AppColor.appColor;
    else if(status == AnimatedButtonStatus.DISABLE)
      return AppColor.appBgGray;
    else if(status == AnimatedButtonStatus.ERROR)
      return AppColor.FieldColor;
    else if(status == AnimatedButtonStatus.COMPLETED)
      return Colors.green;

    return AppColor.appColor;
  }

  Color? getButtonTextColor(){

    if(textColor!=null)
      return textColor;

    if(status == AnimatedButtonStatus.NORMAL)
      return AppColor.appColor;
    else if(status == AnimatedButtonStatus.LOADING)
      return AppColor.appColor;
    else if(status == AnimatedButtonStatus.DISABLE)
      return AppColor.appBgGray;
    else if(status == AnimatedButtonStatus.ERROR)
      return AppColor.Buttontextcolor;
    else if(status == AnimatedButtonStatus.COMPLETED)
      return AppColor.Buttontextcolor;

    return AppColor.appColor;
  }
}

class AnimatedButtonBloc {
  AnimatedButtonStatus status = AnimatedButtonStatus.NORMAL;
  final stateStreamController = StreamController<AnimatedButtonStatus>();
  StreamSink<AnimatedButtonStatus> get statusSink => stateStreamController.sink;
  Stream<AnimatedButtonStatus> get statusStream => stateStreamController.stream;
}