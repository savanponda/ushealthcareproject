import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinebia/apps/common/promo_code_tile.dart';
import 'package:onlinebia/helper/ValidationHelper.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/InputDecoration.dart';


class PromoCodeSec extends StatelessWidget {
  PromoCodeSec({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController promoCodeIC = TextEditingController();
    FocusNode promoCodeNode = FocusNode();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         // GestureDetector(
        //   onTap: (){
        //     NavigatorHelper.add(PromoCodePage());
        //   },
        //   child: Text("Promo Code",
        //       style: TextStyle(
        //         color: Colors.black,
        //         fontSize: 18,
        //         fontFamily: "AppSemiBold",
        //       )
        //   ),
        // ),
        WidgetHelper.getFieldSeparator(),
        Visibility(
          child:TextFormField(
            focusNode: promoCodeNode,
            controller: promoCodeIC,
            decoration:CustomInputDecoration.getInputDecoration(
              hintText: buildTranslate(context, "promoCode"),
              applyIcon: true,
            ),
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            inputFormatters: [LengthLimitingTextInputFormatter(100)],
            validator: (value) =>ValidationHelper.checkBlankValidation(context,value,"value",),
            textInputAction: TextInputAction.next,
          ),
          // child: TextView(
          //   focusNode: promoCodeNode,
          //   controller: promoCodeIC,
          //   label: buildTranslate(context, "promoCode"),
          //   obscureText: false,
          //   textInputAction: true,
          //   textCapitalization: true,
          //   inputFormatters: true,
          //   passwordIcon: false,
          //   applyIcon: true,
          //
          // ),
        ),
        Visibility(
          child: Container(
            height: 100,
            child: ListView.builder(
              itemCount: 1,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return PromoCodeTile(removeButton: true, callBack: (){},);
              },
            ),
          ),
        ),
      ],
    );
  }
}
