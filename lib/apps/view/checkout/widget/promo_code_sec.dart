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
        ),
        Visibility(
          child: Container(
            height: 100,
            child: PromoCodeTile(removeButton: true, callBack: (){},),
            ),
        ),
      ],
    );
  }
}
