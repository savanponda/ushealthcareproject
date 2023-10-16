import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/view/reviews/tile/review_list_tile.dart';
import 'package:UShealthcare/apps/view/reviews/widget/rating_progress.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';

class ReviewListPage extends StatefulWidget {
  const ReviewListPage({Key? key}) : super(key: key);

  @override
  State<ReviewListPage> createState() => _ReviewListPageState();
}

class _ReviewListPageState extends State<ReviewListPage> {

  double? _rating;
  IconData? _selectedIcon;
  double percent = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetHelper.getHeader(
          context,
          buildTranslate(context, "review"),
          showNotificationIcon: false,
          centerTitle: true,
          showBackIcon: true,
          shownotificationIcon: false,
          onAddIconClick: (){
            // NavigatorHelper.add(AddAddressPage());
          },
          onAddressClick: (){
            // NavigatorHelper.remove();
          }
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              RatingProgress(),
              ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return  ReviewListTile();
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}
