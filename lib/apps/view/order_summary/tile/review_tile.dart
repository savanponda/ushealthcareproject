import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:UShealthcare/helper/AssetsHelper.dart';
import 'package:UShealthcare/style/AppColor.dart';

class ReviewTile extends StatefulWidget {

  ReviewTile({Key? key}) : super(key: key);

  @override
  _ReviewTileState createState() => _ReviewTileState();
}

class _ReviewTileState extends State<ReviewTile> {

  double? _rating;
  IconData? _selectedIcon;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white,
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(horizontal: 21),
      child: Padding(
        padding:  EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("Review",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "AppSemiBold",
                              )
                          ),
                          SizedBox(width: 5,),
                          Container(
                            child: RatingBar.builder(
                              initialRating: _rating ?? 2.0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              itemSize: 15,
                              itemPadding: const EdgeInsets.symmetric(horizontal: 1),
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
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Image(
                            height: 20,
                            width: 20,
                            color: AppColor.appBarText,
                            image: AssetsHelper.getIcon("ic_edit.png"),
                          ),
                          SizedBox(width: 5,),
                          Image(
                            height: 20,
                            width: 20,
                            image: AssetsHelper.getIcon("ic_delete.png"),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 12,),
            Container(
              child: Text("This is the best shop to shopping for Fashion Clothes",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: "AppRegular",
                  )
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: Text("John Diesel",
                  style: TextStyle(
                    color: AppColor.FieldTextColor,
                    fontSize: 14,
                    fontFamily: "AppRegular",
                  )
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
