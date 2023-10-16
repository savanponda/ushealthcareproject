import 'package:flutter/material.dart';
import 'package:UShealthcare/helper/AssetsHelper.dart';
import 'package:UShealthcare/style/AppColor.dart';

class AddressAndDeliverTimeTile extends StatelessWidget {

  final String Title;
  final String SubTitle;
  final String Description;
  bool  image;

  AddressAndDeliverTimeTile({Key? key, required this.Title, required this.SubTitle, required this.Description, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shadowColor: Colors.white,
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.only(left: 21,right: 21,top:21),
        child: Padding(
          padding:  EdgeInsets.all(15.0),
          child: Row(
            children: [
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Title,
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 0.05,
                        color: AppColor.appTitle,
                        fontFamily: "AppSemiBold",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      SubTitle,
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 0.05,
                        color: AppColor.appTitle,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      Description,
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 0.05,
                        color: AppColor.FieldTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10,),
              image?Container(
                  height:67,
                  width:81,
                  child: Image(
                      image: AssetsHelper.getIcon("ic_deliveryman.png"))
              ):
              SizedBox(width: 16,),
            ],
          ),
        ),
      ),
    );
  }
}
