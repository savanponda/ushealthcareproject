import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/product_tile.dart';
import 'package:onlinebia/apps/view/home/loader/product_loader.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/AppColor.dart';

import '../../../helper/AssetsHelper.dart';

class SearchBarPage extends StatefulWidget {



  SearchBarPage({Key? key, }) : super(key: key);

  @override
  State<SearchBarPage> createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  bool product = true;
  bool? showcancelIcon;

  late TextEditingController controller;
  void initState() {
    controller = TextEditingController();
    if(product){
      Timer(Duration(seconds: 2), () {
        setState(() {
          product = false;
        });
      });
    }
    super.initState();
  }
  String name = "";

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  onChanged: (val) {
                    setState(() {
                      name=val;
                    });
                  },
                  decoration: InputDecoration(
                    constraints: BoxConstraints(
                      maxHeight: 40,
                      minWidth: 20,
                    ),
                    fillColor: AppColor.FieldColor,
                    filled: true,
                    hintText: "Search",
                    contentPadding: EdgeInsets.all(10),
                    hintStyle: new TextStyle(color: AppColor.filterColor),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.FieldColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.FieldColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.FieldColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.FieldColor), //.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.clear();
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              if(name.isEmpty)...
                  [
                    SingleChildScrollView(
                      child: Container(
                        child: Wrap(
                          spacing: 30,
                          children: [
                            if(product)
                              ProductLoader(),                   // IndicatorLoader(),
                            if(!product)...[
                              for(int index=0;index<10;index++)
                                DelayedDisplay(
                                  child:
                                  ProductTile(likedIcon: false,),),
                            ],
                          ],
                        ),
                      ),
                    )
                  ],
              if(name.isNotEmpty)...[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInUp(
                          delay: const Duration(milliseconds: 200),
                          child: ImageIcon(
                            AssetsHelper.getIcon("ic_search.png"),
                            color: Colors.black,
                            size: 80,
                          )
                      ),
                      FadeInUp(
                        delay: const Duration(milliseconds: 250),
                        child: const Text(
                          "No Result Found ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )
              ]

            ],
          )
        ),
      ),
    );
  }
}
