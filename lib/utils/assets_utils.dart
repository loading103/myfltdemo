import 'package:flutter/material.dart';

class AssetsUtils {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

}
