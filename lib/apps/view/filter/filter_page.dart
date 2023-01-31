import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/product_bottom_navigation.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';
import 'package:onlinebia/style/Fonts.dart';

import '../../../helper/WidgetHelper.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  bool name = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: WidgetHelper.getHeader(
          context,
          buildTranslate(context, "filters"),
          showBackIcon: true,
          centerTitle: true,
          showcancelIcon: true,
          onAddressClick: (){
            // NavigatorHelper.remove();
          }
      ),
      bottomNavigationBar: ProductBottomNavigation(
        callback: (){
          // NavigatorHelper.add(AddCartPage());
        },
        TotalTitle: false,
        BottomButtonTitle1: 'Product Found',
        BottomButtonTitle2: 'Apply Filter',
      ),
      body:SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  height: MediaQuery.of(context).size.height,
                  color: AppColor.filterColor,
                  child: SafeArea(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            buildTranslate(context,"price2"),
                            style:Fonts.filtertext,
                          ),
                          WidgetHelper.getFieldSeparator(height: 30),

                          Text(buildTranslate(context,"category"),
                            style:Fonts.filtertext,
                          ),
                          WidgetHelper.getFieldSeparator(height: 30),

                          Text(buildTranslate(context,"customerRatings"),
                            style:Fonts.filtertext,
                          ),
                          WidgetHelper.getFieldSeparator(height: 30),

                          Text(buildTranslate(context,"discount"),
                            style:Fonts.filtertext,
                          ),
                          WidgetHelper.getFieldSeparator(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SafeArea(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListView.builder(
                                itemCount: 5,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return CheckboxListTile(
                                    title: Text(buildTranslate(context, "signIn")), //checkbox positioned at left
                                    value: name,
                                    checkColor: Colors.white,
                                    activeColor: AppColor.appColor,
                                    controlAffinity: ListTileControlAffinity.leading,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        name = value!;
                                      });
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
