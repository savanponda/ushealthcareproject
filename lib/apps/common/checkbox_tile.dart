import 'package:flutter/material.dart';
import 'package:onlinebia/style/AppColor.dart';

class CheckBoxTile extends StatefulWidget {
  bool value;
  final Function(bool) callback;
  String Title;
   CheckBoxTile({Key? key,required this.value,required this.Title,required this.callback}) : super(key: key);

  @override
  State<CheckBoxTile> createState() => _CheckBoxTileState();
}

class _CheckBoxTileState extends State<CheckBoxTile> {
  bool _checkbox = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
                activeColor: AppColor.appColor,
                value: widget.value, //unchecked
                onChanged: (bool? value) => {
                widget.callback(value!),
            setState(() => _checkbox = !_checkbox),}
            ),
            Text(widget.Title),
          ],
        )
    );
  }
}
