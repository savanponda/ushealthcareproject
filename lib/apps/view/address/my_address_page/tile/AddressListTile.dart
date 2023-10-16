import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/view/address/add_address_page/add_address_page.dart';
import 'package:UShealthcare/helper/NavigatorHelper.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';
import 'package:UShealthcare/style/AppColor.dart';

class AddressListTile extends StatefulWidget {
  int select;
  int? index;
  Function Callback;
   AddressListTile({Key? key, required this.Callback,required this.select, this.index}) : super(key: key);

  @override
  State<AddressListTile> createState() => _AddressListTileState();
}

class _AddressListTileState extends State<AddressListTile> {
  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.index==0?Container():Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: AppColor.appDivider,
          ),
          WidgetHelper.getFieldSeparator(),

          Row(
            children: [
              Expanded(
                child: Text(buildTranslate(context, "johnDiesel"),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "AppBold",
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // Radio(
              //   value:,
              //   activeColor:AppColor.appColor,
              //   groupValue: SelectAddress,
              //   // activeColor: AppColor.appColor,
              //   onChanged: (value) {
              //     setState(() {
              //       SelectAddress = value as int?;
              //     });
              //   },
              // ),

            ],
          ),
          SizedBox(height: 5,),
          Text("+1 3712 3789",
            style: TextStyle(
              fontSize: 14,
              fontFamily: "AppRegular",
              color: AppColor.appSubTitleText,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(buildTranslate(context, "exAddress"),
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "AppRegular",
                    color: AppColor.appSubTitleText,
                  ),
                ),
              ),
            ],
          ),
          WidgetHelper.getFieldSeparator(),
          InkWell(
            onTap: (){
              NavigatorHelper.add(AddAddressPage());
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: AppColor.appColor,width: 1)
              ),
              child: Text(buildTranslate(context, "editAddress"),
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "AppRegular",
                  color: AppColor.appColor,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),


        ],
      ),
    );
  }
}

