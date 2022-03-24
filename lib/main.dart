import 'package:f_shopping_app/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/cart_controller.dart';

void main() {
  Get.lazyPut<CartController>(() => CartController());
  runApp(const MyApp());
}
