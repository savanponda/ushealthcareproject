import 'package:flutter/material.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';

import '../../../../../helper/AssetsHelper.dart';
import '../../../../../style/AppColor.dart';


class CartProductTile extends StatelessWidget {
  final bool MoveToCart ;

  CartProductTile({Key? key, this.MoveToCart=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(10),
      color: Colors.white,
      shadowColor: Colors.blueGrey,
      elevation: 2,
      child: Column(
        children: [
          WidgetHelper.getFieldSeparator(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text("#62",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "AppBold",
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2,),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                                children: [
                                  Text("Size : L",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "AppSemiBold",
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ]
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.all(Radius.circular(5),),
                                  border: Border.all(color:AppColor.appDivider, width: 2),
                                ),
                                child: Icon(Icons.remove),
                              ),
                              SizedBox(width: 5,),
                              Text("01",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "AppMedium",
                                ),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.all(Radius.circular(5),),
                                  border: Border.all(color:AppColor.appBgGray, width: 2),
                                ),
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 3,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: AppColor.appDivider,
          ),
          Container(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: MoveToCart?AssetsHelper.getIcon("ic_save.png"):AssetsHelper.getIcon("ic_move_to_cart.png"),
                        height: 15,
                        width: 15,
                      ),
                      SizedBox(width: 10,),
                      MoveToCart?Text("Save For Later",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "AppSemiBold",
                          )
                      ):Text("Move To Cart",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "AppSemiBold",
                          )
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 1,
                  height: 50,
                  color: AppColor.appDivider,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetsHelper.getIcon("ic_trash.png"),
                        height: 15,
                        width: 15,
                      ),
                      SizedBox(width: 10,),
                      Text("Remove",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "AppSemiBold",
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
