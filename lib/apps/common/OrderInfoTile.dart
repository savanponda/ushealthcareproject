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
                // CachedNetworkImage(
                //   imageUrl: "https://www.reliancedigital.in/medias/Apple-iPhone-13-Smartphones-491997702-i-1-1200Wx1200H?context=bWFzdGVyfGltYWdlc3wzMDkzMTN8aW1hZ2UvanBlZ3xpbWFnZXMvaGI5L2gxMS85ODc4MTAyNjA1ODU0LmpwZ3w5NGFjNjk3MDQ1ZmU2Y2Q1YmY0ZTljZWM4N2JkMjdhNzE0ZmVlZDQxYzJhNjExNDdkZjY1MmQwYjQ2YTc0NWJm",
                //   imageBuilder: (context, imageProvider) =>
                //       Container(
                //         height: 65,
                //         width: 65,
                //         decoration: BoxDecoration(
                //           shape: BoxShape.rectangle,
                //           image: DecorationImage(
                //             image: imageProvider,
                //             fit: BoxFit.contain,
                //           ),
                //         ),
                //       ),
                //   placeholder: (context, url) =>
                //       Container(
                //         height: 65,
                //         width: 65,
                //         decoration: BoxDecoration(
                //           shape: BoxShape.rectangle,
                //         ),
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //         ),
                //       ),
                //   errorWidget: (context, url, error) =>
                //       Container(
                //         height: 65,
                //         width: 65,
                //         decoration: BoxDecoration(
                //           shape: BoxShape.rectangle,
                //         ),
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //         ),
                //       ),
                // ),

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
          ));
  }
}
