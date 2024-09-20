


//common app bar build method
//app Bar method
import 'package:flutter/material.dart';

AppBar customAppBar({
  required String title,
  required Color titleColor,
  Color backgroundColor = Colors.white,
  double elevation = 4.0, required Color appBarColor,
}) {
  return AppBar(
    backgroundColor: backgroundColor,
    elevation: 0, // Set to 0 to remove default shadow
    title: Text(
      title,
      style: TextStyle(
        color: titleColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: IconThemeData(
      color: titleColor,
    ),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            spreadRadius: 0.1,
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
    ),
  );
}