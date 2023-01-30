import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/product_banner.dart';
import 'package:onlinebia/apps/common/product_bottom_navigation.dart';
import 'package:onlinebia/apps/view/cart/cart_page.dart';
import 'package:onlinebia/apps/view/payment/my_payment/my_payment_page.dart';
import 'package:onlinebia/apps/view/product_detail/stream/panel_bloc.dart';
import 'package:onlinebia/apps/view/product_detail/widget/product_color.dart';
import 'package:onlinebia/apps/view/product_detail/widget/product_description.dart';
import 'package:onlinebia/apps/view/product_detail/widget/product_name_detail.dart';
import 'package:onlinebia/apps/view/product_detail/widget/product_size.dart';
import 'package:onlinebia/apps/view/product_detail/widget/similar_product.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen =0;
  double _panelHeightClosed = 400;
  bool slidable=true;
  bool shareButtonAppbar=true;
  bool temp=true;
  late PanelBloc panelBloc;

  @override
  void initState() {
    super.initState();
    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    panelBloc = PanelBloc(true);
    return Scaffold(
      bottomNavigationBar: ProductBottomNavigation(
        callback: (){
          NavigatorHelper.add(CartPage());
        },
        TotalTitle: true,
        BottomButtonTitle1: 'Add To Cart',
        BottomButtonTitle2: 'Checkout',
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            maxHeight: MediaQuery.of(context).size.height,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: _body(),
            panelBuilder: (sc) => _panel(sc),

            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) => setState(() {
              if(pos>0.80)
                slidable=false;
              else
                slidable=true;

              if(pos>0.92)
                shareButtonAppbar=false;
              else
                shareButtonAppbar=true;

              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
              print(" ***********$pos");
            }),
          ),
          // Positioned(
          //     top: 0,
          //     child: ClipRRect(
          //         child: BackdropFilter(
          //             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          //             child: Container(
          //               width: MediaQuery.of(context).size.width,
          //               height: MediaQuery.of(context).padding.top,
          //               color: Colors.transparent,
          //             )))),

          //the SlidingUpPanel Title
          Positioned(
          child: Container(
          width: MediaQuery.of(context).size.width,
          color: slidable?Colors.transparent:Colors.white,
          height: 90,
           )
        ),
          Positioned(
            top: kToolbarHeight,
            left: 20,
            child:Image(
              image: AssetsHelper.getIcon("ic_back.png"),
              height: 20, width: 20,),
          ),
          Visibility(
            visible: shareButtonAppbar?false:true,
            child: Positioned(
              top: kToolbarHeight,
              right: 20,
              child:Row(
                children: [
                  Container(
                      height: 30, width: 30,
                      decoration: BoxDecoration(
                          color: AppColor.FieldColor,
                          shape: BoxShape.circle
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Image(
                          image: AssetsHelper.getIcon("ic_share.png"),),
                      )
                  ),
                  SizedBox(width: 10,),
                  Container(
                      height: 30, width: 30,
                      decoration: BoxDecoration(
                          color: AppColor.FieldColor,
                          shape: BoxShape.circle
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Image(
                          image: AssetsHelper.getIcon("ic_heart_filled.png"),),
                      )
                  ),
                ],
              ),
            ),
          ),
           StreamBuilder(
               stream: panelBloc.panelStream,
               initialData: true,
               builder:(context, AsyncSnapshot<dynamic> snapshot) {
                 return Container();
               } )
        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    print(sc);
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,

          children: [
            SizedBox(height: 22,),
            ProductNameDetail(),
            WidgetHelper.getFieldSeparator(),
            ProductSize(),
            WidgetHelper.getFieldSeparator(),
            ProductColor(),
            WidgetHelper.getFieldSeparator(),
            ProductDescription(),
            WidgetHelper.getFieldSeparator(),
            SimilarProduct(),
            WidgetHelper.getFieldSeparator(),
            WidgetHelper.getFieldSeparator(),
          ],

        ));

  }
  Widget _body() {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.3,
      // width: MediaQuery.of(context).size.width * 0.3,

        child: ProductBanner());
  }
}