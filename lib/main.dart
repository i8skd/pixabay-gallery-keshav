import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixabay_gallery/app/routes/app_pages.dart';
import 'package:pixabay_gallery/app/themes/app_theme.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Pixabay Gallery',
      theme: AppTheme.light,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}