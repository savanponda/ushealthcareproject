import 'dart:async';
import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/my_order/my_order_page.dart';
import 'package:onlinebia/apps/view/order_summary/loader/order_detail_no_loader.dart';
import 'package:onlinebia/apps/view/order_summary/loader/review_page_loader.dart';
import 'package:onlinebia/apps/view/order_summary/tile/address_deliver_time.dart';
import 'package:onlinebia/apps/view/order_summary/tile/review_tile.dart';
import 'package:onlinebia/apps/view/order_summary/widget/order_summary_info.dart';
import 'package:onlinebia/apps/view/order_summary/widget/order_summary_modal.dart';
import 'package:onlinebia/apps/view/reviews/widget/give_review_model.dart';
import 'package:onlinebia/custom/animated_button.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';

import 'loader/order_detail_loader.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override

  AnimatedButtonBloc animatedButtonBloc = AnimatedButtonBloc();
  bool category = true;
  bool order = true;
  bool review = true;

  void initState() {
    super.initState();

    if (category) {
      Timer(Duration(seconds: 2), () {
        setState(() {
          category = false;
        });
      });
    }
    if (order) {
      Timer(Duration(seconds: 2), () {
        setState(() {
          order = false;
        });
      });
    }
    if (review) {
      Timer(Duration(seconds: 2), () {
        setState(() {
          review = false;
        });
      });
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetHelper.getHeader(
          context,
          buildTranslate(context, "myProfil"),
          centerTitle: true,
          showBackIcon: true,
          showNotificationIcon: false,
          onAddressClick: (){
          }
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if(category)
              ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return OrderDetailLoader();
                },
              ),

            if(!category)...[
              Container(
                child: AddressAndDeliverTimeTile(
                  Title: 'Estimated Arrival',
                  SubTitle: 'Friday, 13th January, 2023',
                  Description: 'Processing Your Order',
                  image: true,),
              ),
              Container(
                child: AddressAndDeliverTimeTile(
                  Title: 'Deliver to',
                  SubTitle: '23rd Street, Zara Circle, Western Railway, UK.',
                  Description: 'John Diesel  8975412650',
                  image: false,),
              ),
            ],

            if(order)
              OrderDetailNoLoader(),
             if(!order)
             OrderSummaryInfo(),

             if(review)
               ReviewPageLoader(),
             if(!review)
            Container(
              child: ReviewTile(),
            ),
            Container(
              margin: EdgeInsets.all(21),
              child: StreamBuilder(
                  stream: animatedButtonBloc.statusStream,
                  builder: (context, AsyncSnapshot<dynamic> snapshot) {
                    return Hero(
                      tag: 'cancelYourOrder',
                      child: Material(
                        elevation: 0,
                        child: AnimatedButton(
                          backgroundColor: AppColor.appBtnErrorText,
                          text: buildTranslate(context, "cancelYourOrder"),
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
                                NavigatorHelper.add(MyOrderPage());

                              });
                            });
                          },
                          textColor: Colors.white,
                        ),
                      ),
                    );
                  }
              ),
            ),
            MaterialButton(
              onPressed: () {
                showModalBottomSheet(
                    isDismissible: false, // offline-swipable
                    context: context,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: Container(
                          height: 415,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColor.appWhite,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25))),
                            child: Container(
                              child: GiveReviewModel(),
                            )
                          ),
                        ),
                      );
                    });
              },
              child:  Text(buildTranslate(context, "giveReview"), style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColor.appColor,
                fontFamily: "AppSemiBold",
              ),),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}

