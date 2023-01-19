import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/apps/view/home/categoryicon_loader.dart';

import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';
import '../../tiles/CategoryIconTIle.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  bool category = true;

  void initState() {
    super.initState();

    if(category){
      Timer(Duration(seconds: 2), () {
        setState(() {
          category = false;
        });
      });
    }}
  @override  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: WidgetHelper.getHeader(
            context,
            buildTranslate(context, "fashion"),
            showBackIcon: true,
            showNotificationIcon: false,
            centerTitle: true,
            onAddressClick: (){
              // NavigatorHelper.remove();
            }
        ),
        // bottomNavigationBar: TabBarScreen(),
        body: Container(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Wrap(
                      spacing: MediaQuery.of(context).size.width*0.09,
                      alignment: WrapAlignment.start,
                      children: [
                        if(category)
                          for(int index=0;index<11;index++)
                            CategoryIconLoader(

                            ),


                        if(!category)
                        for(int index=0;index<11;index++)
                           CategoryIconTile(
                              image: 'ic_fashion.png',
                              title: 'Fashion',
                              IconHeight: 80,
                              IconWidth: 80,
                        )

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
