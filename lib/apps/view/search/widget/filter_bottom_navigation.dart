import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/view/filter/filter_page.dart';
import 'package:UShealthcare/apps/view/filter/widget/sort_by_page.dart';
import 'package:UShealthcare/helper/AssetsHelper.dart';
import 'package:UShealthcare/helper/NavigatorHelper.dart';
import 'package:UShealthcare/style/AppColor.dart';

class FilterBottom extends StatelessWidget {
  const FilterBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0.5,
              blurRadius: 4,
              offset: Offset(0,-5), // changes position of shadow
            ),],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    showModalBottomSheet(
                        isDismissible: false, // offline-swipable
                        context: context,
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            child: Container(
                              height: 333,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColor.appWhite,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          topRight: Radius.circular(25))),
                                  child: Container(
                                    child: SortBy(),
                                  )
                              ),
                            ),
                          );
                        });
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Text("Sort By",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "AppSemiBold",
                            )
                        ),
                        SizedBox(width: 7),
                        Image(
                          height: 8,
                          width: 8,
                          image: AssetsHelper.getIcon("ic_arrow.png"),
                        ),
                      ]
                  ),
                ),
              ),

              Container(
                width: 1,
                height: MediaQuery.of(context).size.height,
                color: Colors.grey.shade300,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    NavigatorHelper.add(FilterPage());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Filter By",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "AppSemiBold",
                              color: Colors.black
                          ),

                      ),
                      SizedBox(width: 7),
                      Image(
                        height: 12,
                        width: 12,
                        image: AssetsHelper.getIcon("ic_filter.png"),
                      ),
                    ],
                  ),
                ),
              ),
            ])
    );
  }
}
