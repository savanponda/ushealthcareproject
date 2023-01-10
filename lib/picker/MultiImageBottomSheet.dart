import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../localization/AppLocalizations.dart';
import '../style/AppColor.dart';
import '../style/Fonts.dart';

class MultiImageBottomSheet extends StatefulWidget {
  const MultiImageBottomSheet({Key? key, required this.callBack})
      : super(key: key);

  @override
  _MultiImageBottomSheetState createState() => _MultiImageBottomSheetState();
  final Function callBack;

}

class _MultiImageBottomSheetState extends State<MultiImageBottomSheet> {

  TextStyle titleStyle = TextStyle(
      fontFamily: 'AppMPRegular',
      fontSize: 16.0,
      color: AppColor.appColor);

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
              Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0))),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      buildTranslate(context, "uploadImage"),
                      style: Fonts.buttonStyle,
                    ),
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
                                  Icons.camera_alt,
                                  color: AppColor.appColor,
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(buildTranslate(context, "takeAPhoto"),
                                      style: Fonts.buttonStyle),
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
                                      style: Fonts.buttonStyle),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            pickImage(0);
                            // loadAssets();
                          },
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          elevation: 0,
                          color: AppColor.appColor,
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
                                  Icons.cancel,
                                  color: Colors.white,
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(buildTranslate(context, "cancel"),
                                      style: Fonts.buttonStyle),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
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
    List<XFile>? images = [];
    if (index == 0) {
     images = await ImagePicker().pickMultiImage();
      // xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    } else {
      xFile = await ImagePicker().pickImage(source: ImageSource.camera);
    }

    setState(() {
      if (xFile != null) {
        print("Picked File = " + xFile.path);
        imageFiles.add(File(xFile.path));
        widget.callBack(imageFiles);

        Navigator.pop(context);

      } else if(images!.length > 0){
        for (int i = 0; i < images.length; i++) {
          imageFiles.add(File(images[i].path));
        }

        if (imageFiles.length > 0) {
          widget.callBack(imageFiles);

          Navigator.pop(context);

        }
      }
      print("Picked File = null");
    });
  }

}