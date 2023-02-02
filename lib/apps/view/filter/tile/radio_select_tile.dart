import 'package:flutter/material.dart';

class RadioSelectTile extends StatelessWidget {

  final String Title;
  int? Select;

  RadioSelectTile({Key? key,  this.Select,required this.Title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Title),
              Radio(
                value: "male",
                groupValue: Select,
                onChanged: (value){
                  Select;
                },
              ),
            ],
          ),
        ],
      )
    );
  }
}
