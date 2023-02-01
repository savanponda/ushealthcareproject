import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:onlinebia/helper/AssetsHelper.dart';
import 'package:onlinebia/style/AppColor.dart';

class ReviewListTile extends StatefulWidget {
  const ReviewListTile({Key? key}) : super(key: key);

  @override
  State<ReviewListTile> createState() => _ReviewListTileState();
}

class _ReviewListTileState extends State<ReviewListTile> {

  double? _rating;
  IconData? _selectedIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(horizontal: 21,vertical: 15),
      child: Padding(
        padding:  EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height:60,
                  width: 60,
                  child: CircleAvatar(
                    radius: 48, // Image radius
                    backgroundImage: AssetsHelper.getImage("product.png"),
                  )
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Jessica Jons",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: "AppSemiBold",
                        )
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: _rating ?? 2.0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemSize: 13,
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
                        SizedBox(width: 5,),
                        Text("5.0",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              fontFamily: "AppBold",
                            )
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 5,),
                Text("2 Days Ago",
                    style: TextStyle(
                      color: AppColor.appSubTitleText,
                      fontSize: 10,
                      fontFamily: "AppSemiBold",
                    )
                ),
              ],
            ),
            SizedBox(height: 12,),
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                style: TextStyle(
                  color: AppColor.appSubTitleText,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  fontFamily: "AppRegular",
                )
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
