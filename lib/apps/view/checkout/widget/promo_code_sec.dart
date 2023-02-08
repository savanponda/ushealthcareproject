import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinebia/apps/common/promo_code_tile.dart';
import 'package:onlinebia/apps/view/checkout/bloc/promo_code_apply_bloc.dart';
import 'package:onlinebia/apps/view/promo_code/promo_code_page.dart';
import 'package:onlinebia/helper/NavigatorHelper.dart';
import 'package:onlinebia/helper/ValidationHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';
import 'package:onlinebia/style/InputDecoration.dart';


class PromoCodeSec extends StatelessWidget {
  PromoCodeSec({Key? key}) : super(key: key);
  PromoCodeApplyBloc applyBloc = PromoCodeApplyBloc();
  @override
  Widget build(BuildContext context) {

    TextEditingController promoCodeIC = TextEditingController();
    FocusNode promoCodeNode = FocusNode();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder<bool?>(
          stream: applyBloc.promoCodeStream,
          builder: (context, snapshot) {
            print(snapshot.data);

            bool applyPromoCode = snapshot.data??false;

            return  Column(
              children: [
                if(!applyPromoCode)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    focusNode: promoCodeNode,
                    controller: promoCodeIC,
                    decoration:CustomInputDecoration.getInputDecoration(
                        hintText: buildTranslate(context, "promoCode"),
                        applyIcon: true,
                        applyButtonClick: (){
                          print("object");
                          applyBloc.updateSink.add(true);           }
                    ),
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    validator: (value) =>ValidationHelper.checkBlankValidation(context,value,"value",),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                if(applyPromoCode)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: PromoCodeTile(removeButton: true, callBack: (){
                    applyBloc.updateSink.add(false);
                  },),
                ),
              ],
            );
          }),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: (){
                NavigatorHelper.add(PromoCodePage());
              },
              splashColor: Colors.transparent,
              child: Text(buildTranslate(context, "viewAll"),
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "AppSemiBold",
                ),
              ),
            ),
          ],
        ),



      ],
    );
  }
}
