import 'package:flutter/material.dart';

class NoDataFoundView extends StatelessWidget {

  final String msg;

  const NoDataFoundView({Key? key, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          child: Text(
              msg,
              style:
              TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              )),
        ));
  }
}
