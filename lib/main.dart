import 'dart:convert';
import 'dart:io';

import 'package:async_zip/async_zip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zip_reader/views/product_detail.dart';
import 'package:flutter_zip_reader/views/product_list.dart';
import 'package:path/path.dart' as path;
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final route = [
    GetPage(name: "/detail/:id", page: () => ProductDetail()),
    GetPage(name: "/list", page: () => ProductList()),
  ];
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: route,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProductList(),
    );
  }
}
