import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../localization/AppLocalizations.dart';
import '../style/AppColor.dart';

class MediaPickerBottomSheet extends StatefulWidget {

  @override
  _MediaPickerBottomSheetState createState() => _MediaPickerBottomSheetState();

  final Function callBack;

  const MediaPickerBottomSheet({Key? key, required this.callBack}) : super(key: key);
}

class _MediaPickerBottomSheetState extends State<MediaPickerBottomSheet> {
  TextStyle textStyle = TextStyle(
      fontFamily: 'AppSemiBold',
      fontSize: 16.0,
      color: AppColor.appColor
  );

  List<File> imageFiles = [];

  bool isTips = true;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return  Container(
      child: Wrap(
        children: [
          Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                decoration: new BoxDecoration(
                    color:Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0))),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          elevation: 0,
                          // color: AppColor.appColor,
                          padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                          splashColor: AppColor.appColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10),
                            side:
                            BorderSide(color: AppColor.appColor),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: AppColor.appColor,
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(buildTranslate(context, "takeAPhoto"),
                                      style: textStyle),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            pickImage(1);
                            // _showCamera();
                          },
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          elevation: 0,
                          // color: AppColor.appColor,
                          padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                          splashColor: AppColor.appColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10),
                            side:
                            BorderSide(color: AppColor.appColor),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.image,
                                  color: AppColor.appColor,
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                      buildTranslate(context, "selectAnImage"),
                                      style: textStyle),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            //Navigator.pop(context);
                            //widget.callback(widget.indexMy,tmp.length>0?true:false);
                            pickImage(0);
                            // loadAssets();
                          },
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    // SizedBox(
                    //     width: double.infinity,
                    //     child: MaterialButton(
                    //       elevation: 0,
                    //       color: AppColor.appColor,
                    //       padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                    //       splashColor: AppColor.appColor,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: new BorderRadius.circular(10),
                    //         side:
                    //         BorderSide(color: AppColor.appColor),
                    //       ),
                    //       child: Stack(
                    //         children: [
                    //           Align(
                    //             alignment: Alignment.centerLeft,
                    //             child: Icon(
                    //               Icons.cancel,
                    //               color: Colors.white,
                    //             ),
                    //           ),
                    //           Positioned.fill(
                    //             child: Align(
                    //               alignment: Alignment.center,
                    //               child: Text(buildTranslate(context, "cancel"),
                    //                   style: textStyle.copyWith(color: Colors.white)),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //       onPressed: () {
                    //         NavigatorHelper.remove(value: true);
                    //         //widget.callback(widget.indexMy,tmp.length>0?true:false);
                    //       },
                    //     )
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future pickImage(int index) async {
    XFile? xFile;
    if (index == 0) {
      xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    } else {
      xFile = await ImagePicker().pickImage(source: ImageSource.camera);
    }

    setState(() {
      if (xFile != null) {
        print("Picked File = " + xFile.path);
        //Navigator.pop(context);
        //widget.callBack(File(xFile.path));
        cropImage(File(xFile.path));
      } else {
        print("Picked File = null");
      }
    });
  }

  cropImage(File imageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Onlinebia Cropper',
              toolbarColor: AppColor.appColor,
              toolbarWidgetColor: Colors.white,
              statusBarColor: AppColor.appColor,
              initAspectRatio: CropAspectRatioPreset.ratio3x2,
              lockAspectRatio: false,
          ),
          IOSUiSettings(
            minimumAspectRatio: 1.0,
          )
        ],
    );

    if (croppedFile != null) {
      Navigator.pop(context);
      widget.callBack(File(croppedFile.path));
    }
  }
}
