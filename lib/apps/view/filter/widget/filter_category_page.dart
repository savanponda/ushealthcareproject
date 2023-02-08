import 'package:flutter/material.dart';
import 'package:onlinebia/apps/common/filter_chip_tile.dart';
import 'package:onlinebia/style/AppColor.dart';

class FilterCategoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double w2 = (w <= 390) ? 83 : 100;
    return  Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FilterChipTile(
                  title: "Food",
                  color: Colors.white,
                  backgroundColor: AppColor.appColor,
                  h: h * 0.0622,
                  w: w2,
                  marginLeft: 10,
                  marginRight: 10,
                ),
                FilterChipTile(
                  title: "Fuel",
                  color: Colors.black,
                  backgroundColor: AppColor.filterColor,
                  h: h * 0.0622,
                  w: w2,
                  marginLeft: 10,
                  marginRight: 10,
                ),
                FilterChipTile(
                  title: "Travel",
                  color: Colors.white,
                  backgroundColor: AppColor.appColor,
                  h: h * 0.0622,
                  w: w2,
                  marginLeft: 10,
                  marginRight: 10,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FilterChipTile(
                  title: "Shopping",
                  color: Colors.black,
                  backgroundColor: AppColor.filterColor,
                  h: h * 0.0622,
                  w: w2 + 30,
                  marginLeft: 10,
                  marginRight: 10,
                ),
                FilterChipTile(
                  title: "Medicines",
                  color: Colors.black,
                  backgroundColor: AppColor.filterColor,
                  h: h * 0.0622,
                  w: w2 + 30,
                  marginLeft: 10,
                  marginRight: 30,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FilterChipTile(
                  title: "Movies",
                  color: Colors.white,
                  backgroundColor: AppColor.appColor,
                  h: h * 0.0622,
                  w: w2 + 15,
                  marginLeft: 10,
                  marginRight: 10,
                ),
                FilterChipTile(
                  title: "Garage",
                  color: Colors.black,
                  backgroundColor: AppColor.filterColor,
                  h: h * 0.0622,
                  w: w2 + 15,
                  marginLeft: 10,
                  marginRight: 90,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FilterChipTile(
                  title: "Rent",
                  color: Colors.black,
                  backgroundColor: AppColor.filterColor,
                  h: h * 0.0622,
                  w: w2,
                  marginLeft: 10,
                  marginRight: 10,
                ),
                FilterChipTile(
                  title: "Fun",
                  color: Colors.black,
                  backgroundColor: AppColor.filterColor,
                  h: h * 0.0622,
                  w: w2,
                  marginLeft: 10,
                  marginRight: 10,
                ),
                FilterChipTile(
                  title: "Others",
                  color: Colors.black,
                  backgroundColor: AppColor.filterColor,
                  h: h * 0.0622,
                  w: w2 + 5,
                  marginLeft: 10,
                  marginRight: 0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }}