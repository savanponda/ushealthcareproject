import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:onlinebia/apps/view/reviews/review_list_page.dart';
import 'package:onlinebia/custom/animated_button.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/ValidationHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';

class GiveReviewModel extends StatefulWidget {
   GiveReviewModel({Key? key}) : super(key: key);

  @override
  State<GiveReviewModel> createState() => _GiveReviewModelState();
}

class _GiveReviewModelState extends State<GiveReviewModel> {
   double? _rating;
   IconData? _selectedIcon;
   TextEditingController addressIC = TextEditingController();
   FocusNode addressNode = FocusNode();
   AnimatedButtonBloc animatedButtonBloc = AnimatedButtonBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 21),
      child: Column(
        children: [
          SizedBox(height: 35,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(buildTranslate(context, "giveReview"),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontFamily: "AppSemiBold",
                ),
              ),
              GestureDetector(
                onTap: (){
                  NavigatorHelper.remove();
                },
                child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColor.FieldBorderColor,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppColor.FieldBorderColor, width: 2),
                    ),
                    child: Image(
                      image: AssetsHelper.getIcon("ic_close.png"),
                    )
                ),
              )
            ],
          ),
          SizedBox(height: 33,),
          Container(
            child: RatingBar.builder(
              initialRating: _rating ?? 2.0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemSize: 35,
              itemPadding: EdgeInsets.symmetric(horizontal: 1),
              itemBuilder: (context, _) => Icon(
                _selectedIcon ?? Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                _rating = rating;
                setState(() {

                });
              },
            ),
          ),
          SizedBox(height: 32,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(buildTranslate(context, "detailReview"),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColor.appSubTitleText,
                  fontStyle: FontStyle.normal,
                  fontFamily: "AppRegular",
                ),
              ),
            ],
          ),
          SizedBox(height: 8,),
          TextFormField(
            focusNode: addressNode,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                borderSide: BorderSide(width: 1,color:  AppColor.appColor),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                borderSide: BorderSide(width: 1,color:  AppColor.appColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                borderSide: BorderSide(width: 1,color:  AppColor.appColor),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  borderSide: BorderSide(width: 1,)
              ),
              hintText: buildTranslate(context, "reviewField"),
            ),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.sentences,
            controller: addressIC,
            minLines: 3,
            maxLines: 5,
            inputFormatters: [LengthLimitingTextInputFormatter(250)],
            validator: (value) => ValidationHelper.checkBlankValidation(context, value, "messageValidation"),
          ),
          WidgetHelper.getFieldSeparator(height: 50),
          StreamBuilder(
              stream: animatedButtonBloc.statusStream,
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                return Hero(
                  tag: 'cancelYourOrder',
                  child: Material(
                    elevation: 0,
                    child: AnimatedButton(
                      text: buildTranslate(context, "submit"),
                      status: snapshot.data??AnimatedButtonStatus.NORMAL,
                      onClick: (){
                        animatedButtonBloc.statusSink.add(AnimatedButtonStatus.LOADING);
                        Timer(Duration(seconds: 1), () {
                          setState(() {
                            animatedButtonBloc.statusSink.add(AnimatedButtonStatus.COMPLETED);
                          });
                        });
                        Timer(Duration(seconds: 2), () {
                          setState(() {
                            animatedButtonBloc.statusSink.add(AnimatedButtonStatus.NORMAL);
                            NavigatorHelper.add(ReviewListPage());
                          });
                        });
                      },
                      textColor: Colors.white,
                    ),
                  ),
                );
              }
          ),
        ],
      ),
    );
  }
}
