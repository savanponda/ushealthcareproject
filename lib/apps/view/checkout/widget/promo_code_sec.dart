import 'package:flutter/material.dart';

import '../../../../custom/TextView.dart';
import '../../../../helper/NavigatorHelper.dart';
import '../../../../helper/WidgetHelper.dart';
import '../../../../localization/AppLocalizations.dart';
import '../../../common/promo_code_tile.dart';
import '../../promo_code/promo_code_page.dart';

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
          child: TextView(
            focusNode: promoCodeNode,
            controller: promoCodeIC,
            label: buildTranslate(context, "promoCode"),
            obscureText: false,
            textInputAction: true,
            textCapitalization: true,
            inputFormatters: true,
            passwordIcon: false,
            applyIcon: true,

          ),
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
                return PromoCodeTile(removeButton: true,);
              },
            ),
          ),
        ),
      ],
    );
  }
}
