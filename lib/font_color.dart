import 'dart:ui';

import 'package:flutter/material.dart';

Color ThemeColor = const Color.fromRGBO(220, 220, 220, 1.0);
TextStyle TitleStyle = const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black);
//屏幕宽高
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;