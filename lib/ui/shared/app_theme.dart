import 'package:flutter/material.dart';

class ZKAppTheme {

  // 普通模式
  static final ThemeData norTheme = ThemeData(
      // 主题色
      primarySwatch: Colors.blue,
      // 背景色
      canvasColor: Color.fromRGBO(245, 245, 245, 1),
      // 文本主题
      textTheme: TextTheme(
      )
  );

  // 暗黑模式
  static final ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      textTheme: TextTheme(
      )
  );
}

