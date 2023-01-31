import 'package:flutter/material.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';

class SearchBarPage extends StatefulWidget {
  const SearchBarPage({Key? key}) : super(key: key);

  @override
  State<SearchBarPage> createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: WidgetHelper.getSearchHeader(
          context,
          buildTranslate(context, ""),
          shownotificationIcon: true,
          showBackIcon: true,
          showcancelIcon:true,
          onAddressClick: (){
            // NavigatorHelper.remove();
          }
      ),
    );
  }
}
