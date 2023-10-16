import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';
import 'package:UShealthcare/style/AppColor.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RatingProgress extends StatefulWidget {
  const RatingProgress({Key? key}) : super(key: key);

  @override
  State<RatingProgress> createState() => _RatingProgressState();
}

class _RatingProgressState extends State<RatingProgress> {

  double? _rating;
  IconData? _selectedIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(18),
      child: Column(
        children: [
          Text("4.2",
            style: TextStyle(
              fontSize: 25,
              color: AppColor.appTitle,
              fontStyle: FontStyle.normal,
              fontFamily: "AppBold",
            ),
          ),
          WidgetHelper.getFieldSeparator(height: 11),
          RatingBar.builder(
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
          WidgetHelper.getFieldSeparator(),
          Text(buildTranslate(context, "basedon50Reviews"),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColor.appSubTitleText,
              fontStyle: FontStyle.normal,
              fontFamily: "AppRegular",
            ),
          ),
          WidgetHelper.getFieldSeparator(height: 30),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(buildTranslate(context, "excellent"),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: AppColor.appTitle,
                      fontStyle: FontStyle.normal,
                      fontFamily: "AppRegular",
                    ),
                  ),
                  WidgetHelper.getFieldSeparator(height: 20),
                  Text(buildTranslate(context, "good"),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: AppColor.appTitle,
                      fontStyle: FontStyle.normal,
                      fontFamily: "AppRegular",
                    ),
                  ),
                  WidgetHelper.getFieldSeparator(height: 20),
                  Text(buildTranslate(context, "average"),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: AppColor.appTitle,
                      fontStyle: FontStyle.normal,
                      fontFamily: "AppRegular",
                    ),
                  ),
                  WidgetHelper.getFieldSeparator(height: 20),
                  Text(buildTranslate(context, "belowAverage"),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: AppColor.appTitle,
                      fontStyle: FontStyle.normal,
                      fontFamily: "AppRegular",
                    ),
                  ),
                  WidgetHelper.getFieldSeparator(height: 20),
                  Text(buildTranslate(context, "poor"),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: AppColor.appTitle,
                      fontStyle: FontStyle.normal,
                      fontFamily: "AppRegular",
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  children: [
                    LinearPercentIndicator(
                      barRadius: Radius.circular(20),
                      width: MediaQuery.of(context).size.width-116,
                      animation: true,
                      lineHeight: 8.0,
                      animationDuration: 2500,
                      percent: 0.9,
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: AppColor.ratingGreen,
                    ),
                    WidgetHelper.getFieldSeparator(height: 20),
                    LinearPercentIndicator(
                      barRadius: Radius.circular(20),
                      width: MediaQuery.of(context).size.width-116,
                      animation: true,
                      lineHeight: 8.0,
                      animationDuration: 2500,
                      percent: 0.8,
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: AppColor.ratingLigntGreen,
                    ),
                    WidgetHelper.getFieldSeparator(height: 20),
                    LinearPercentIndicator(
                      barRadius: Radius.circular(20),
                      width: MediaQuery.of(context).size.width-116,
                      animation: true,
                      lineHeight: 8.0,
                      animationDuration: 2500,
                      percent: 0.6,
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: AppColor.ratingYellow,
                    ),
                    WidgetHelper.getFieldSeparator(height: 20),
                    LinearPercentIndicator(
                      barRadius: Radius.circular(20),
                      width: MediaQuery.of(context).size.width-116,
                      animation: true,
                      lineHeight: 8.0,
                      animationDuration: 2500,
                      percent: 0.4,
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: AppColor.ratingOrange,
                    ),
                    WidgetHelper.getFieldSeparator(height: 20),
                    LinearPercentIndicator(
                      barRadius: Radius.circular(20),
                      width: MediaQuery.of(context).size.width-116,
                      animation: true,
                      lineHeight: 8.0,
                      animationDuration: 2500,
                      percent: 0.2,
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: AppColor.ratingRed,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
