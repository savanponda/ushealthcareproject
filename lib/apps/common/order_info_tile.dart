import 'package:flutter/material.dart';
import '../../helper/AssetsHelper.dart';

class OrderInfoTile extends StatelessWidget {

  OrderInfoTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 80,
                    width: 80,
                    child: Image(image: AssetsHelper.getImage('thumnail.png'))
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("T-Shirt",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "AppSemiBold",
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10,),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "#62", style: TextStyle(
                              fontSize: 18,
                              fontFamily: "AppBold",
                              color: Colors.black,
                            ),),
                            TextSpan(
                              text: "Size : L", style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: "AppSemiBold"
                            ),),
                          ],
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
