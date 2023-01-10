import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../style/AppColor.dart';
import 'KeyboardHideView.dart';


class LoaderView extends StatelessWidget {
  final Widget child;
  final bool showLoader;
  final Color? color;

  LoaderView({required this.child, required this.showLoader, this.color});

  @override
  Widget build(BuildContext context) {

    // return KeyboardHideView(
    //   child: Stack(
    //     children: [
    //       this.child,
    //       Visibility(
    //         visible: showLoader,
    //         child: Positioned.fill(
    //             child: Center(
    //               child: SpinKitDoubleBounce(
    //                 color: color ?? AppColor.appColor,
    //                 size: 50.0,
    //               ),
    //             )
    //         ),
    //       )
    //     ],
    //   ),
    // );

    return KeyboardHideView(
      child: ModalProgressHUD(
        child:this.child,
        inAsyncCall: showLoader,
        progressIndicator: SpinKitDoubleBounce(
          color: color ?? AppColor.appColor,
          size: 50.0,
        ),
      ),
    );
  }
}