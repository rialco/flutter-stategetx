import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f_shopping_app/controllers/cart_controller.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);

  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Obx(() => Container(
            padding: const EdgeInsets.all(8.0), 
            alignment: Alignment.center,
            child: Text( "Total: " + controller.total.toString() + " usd",
            style: const TextStyle(
                fontSize: 25.0,
                color: Colors.blueGrey,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400))
                ))
      ),
    );
  }
}
