import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/product_service.dart';
import '../models/productModel.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late Future<Product> futureProductDetail;
  final int id = int.parse(Get.parameters['id'].toString());

  @override
  void initState() {
    super.initState();
    futureProductDetail = ProductService().fetchProductDetail(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: SafeArea(
        child: FutureBuilder<Product>(
          future: futureProductDetail,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              Product productDetail = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productDetail.category,
                        style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8),
                    Text(productDetail.description,
                        style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    Text('ID: ${productDetail.id}',
                        style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    Text(productDetail.title,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
              );
            } else {
              return Center(child: Text('No product found'));
            }
          },
        ),
      ),
    );
  }
}
