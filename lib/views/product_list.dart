import 'package:flutter/material.dart';
import 'package:flutter_zip_reader/api/product_service.dart';
import 'package:flutter_zip_reader/const.dart';
import 'package:flutter_zip_reader/models/productModel.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future<List<Product>> futureProducts;
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    futureProducts = ProductService().fetchProducts();
    futureProducts.then((productList) {
      setState(() {
        products = productList;
      });
      print(products);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products List"),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: ProductCard(
              title: products[index].title,
              price: products[index].price,
              category: products[index].category,
              image: products[index].image,
            ),
            onTap: () {
              Get.toNamed('/detail/${products[index].id}');
            },
          );
        },
      ),
    );
  }
}
