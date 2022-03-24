import 'package:f_shopping_app/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/product.dart';
import '../Widgets/banner.dart';

class ProductList extends StatelessWidget {
  ProductList({Key? key}) : super(key: key);

  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [CustomBanner(50), customAppBar()],
            ),
            Expanded(
              child:  Obx(() => ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return _row(controller.products[index], index);
                  })
                  ),
            )
          ],
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _row(Product product, int index) {
    return _card(product);
  }

  Widget _card(Product product) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(product.name),
        Text(product.price.toString()),
        Column(
          children: [
            IconButton(onPressed: () => controller.updateItem(product.id, QuantityType.positive), icon: const Icon(Icons.arrow_upward)),
            IconButton(onPressed: () => controller.updateItem(product.id, QuantityType.negative), icon: const Icon(Icons.arrow_downward))
          ],
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Quantity"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.quantity.toString()),
            ),
          ],
        )
      ]),
    );
  }
}
