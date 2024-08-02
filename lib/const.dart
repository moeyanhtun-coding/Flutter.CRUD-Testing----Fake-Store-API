import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String title;
  final double price;
  final String image;
  final String category;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: Text(widget.title),
            subtitle: Text(
              widget.category,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.network(widget.image),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.price.toString(),
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }
}
