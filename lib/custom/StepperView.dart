import 'package:flutter/material.dart';
import '../helper/AssetsHelper.dart';
import '../style/AppColor.dart';
import '../style/Fonts.dart';

class StepperView extends StatelessWidget {

  const StepperView({
    Key? key,

    this.activecolor,
    this.deactivecolor,
    required this.progress,
    required this.count,

  }) : super(key: key);

  final Color? activecolor;
  final Color? deactivecolor;
  final int progress;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(int i=1; i<=count; i++ )...[
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: i<=progress?activecolor:deactivecolor,
                  shape: BoxShape.circle,
                ),
              ),

              if(count  != i)
              Expanded(
                child: Row(
                  children: List.generate(200~/3, (index) => Expanded(
                    child: Container(
                      color: index%2==0?i<progress?activecolor:deactivecolor
                          :Colors.white,
                      height: 2,
                    ),
                  )),
                ),
              ),

            ]

          ],
        ),
    );
  }
}
