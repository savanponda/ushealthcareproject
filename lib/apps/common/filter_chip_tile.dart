// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:UShealthcare/style/AppColor.dart';

class FilterChipTile extends StatefulWidget {
  final String title;
  Color color;
  Color backgroundColor;
  final double marginLeft;
  final double marginRight;
  final double? h;
  final double? w;
  FilterChipTile({
    Key? key,
    required this.title,
    this.color = Colors.black,
    this.backgroundColor = Colors.white,
    required this.marginLeft,
    required this.marginRight,
    this.h,
    this.w,
  }) : super(key: key);

  @override
  State<FilterChipTile> createState() => _FilterChipTileState();
}

class _FilterChipTileState extends State<FilterChipTile> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    //double w = MediaQuery.of(context).size.width;
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            //print(w);
            if ((isSelected||widget.color == Colors.white) &&
                (widget.backgroundColor == AppColor.appColor)) {
              widget.color = Colors.black;
              widget.backgroundColor = AppColor.filterColor;
            } else {
              widget.color = Colors.white;
              widget.backgroundColor = AppColor.appColor;
            }
          });
        },
        child: Wrap(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 9),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      color: widget.backgroundColor,
                      borderRadius: BorderRadius.circular(25),

                  ),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        color: widget.color,
                        fontSize: 14),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
