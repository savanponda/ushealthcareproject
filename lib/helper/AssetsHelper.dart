import 'package:flutter/material.dart';

class AssetsHelper {

  static AssetImage getIcon(String name) {
    return AssetImage("assets/icons/"+name);
  }

  static AssetImage getImage(String name) {
    return AssetImage("assets/images/"+name);
  }

  static AssetImage getLogo(String name) {
    return AssetImage("assets/logo/"+name);
  }
  static AssetImage ushealcarenurses(String name) {
    return AssetImage("assets/ushealcarenurses/"+name);
  }
}