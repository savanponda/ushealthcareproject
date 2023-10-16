import 'package:flutter/material.dart';
import 'package:UShealthcare/custom/app_loader.dart';

class OrderDetailLoader extends StatelessWidget {
  const OrderDetailLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
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
                    AppLoaders(height: 15, width: 20*6, radius: 20,reverse: true,),

                    SizedBox(height: 10),
                    AppLoaders(height: 15, width: 30*5, radius: 20),

                    SizedBox(height: 10),
                    AppLoaders(height: 15, width: 25*5, radius: 20,reverse: true,),

                  ],
                ),
              ),
              SizedBox(width: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
