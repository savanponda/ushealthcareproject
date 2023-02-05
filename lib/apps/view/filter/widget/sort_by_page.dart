
import 'package:flutter/material.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';

class SortBy extends StatefulWidget {
  SortBy({Key? key, }) : super(key: key);

  @override
  State<SortBy> createState() => _SortByState();
}

class _SortByState extends State<SortBy> {

  List<RadioButton> users = [];
  RadioButton? selectedUser;
  int? selectedRadio;
  int? selectedRadioTile;


  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
    users = RadioButton.getUsers();
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }
  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }
  setSelectedUser(RadioButton user) {
    setState(() {
      selectedUser = user;
    });
  }

  List<Widget> createRadioListUsers() {
    List<Widget> widgets = [];
    for (RadioButton user in users!) {
      widgets.add(
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(user.firstName!),
              Radio(
                value: user,
                groupValue: selectedUser,
                onChanged: (currentUser) {
                  setSelectedUser(user);
                },
              ),
            ],
          ),
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Text(buildTranslate(context, "SORTBy"),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              fontFamily: "AppSemiBold",
            ),
          ),
          SizedBox(height: 20,),
          Column(
            children: createRadioListUsers(),
          ),
        ],
      ),
    );
  }
}


class RadioButton{
  int? userId;
  String? firstName;

  RadioButton({this.userId, this.firstName});

  static List<RadioButton> getUsers() {
    return <RadioButton>[
      RadioButton(userId: 1, firstName: "Sub Total"),
      RadioButton(userId: 2, firstName: "Shipping"),
      RadioButton(userId: 3, firstName: "Price - Low to High"),
      RadioButton(userId: 4, firstName: "Price - High to Low"),
      RadioButton(userId: 5, firstName: "Newest First"),
    ];
  }
}