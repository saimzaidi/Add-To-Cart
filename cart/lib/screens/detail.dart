import 'package:flutter/material.dart';

List<Map<String, dynamic>> cartItems = [];

// ignore: must_be_immutable
class ProductDetail extends StatelessWidget {
  String imgUrl;
  String price;
  String title;
  String subtitle;

  ProductDetail({
    super.key,
    required this.imgUrl,
    required this.price,
    required this.title,
    required this.subtitle,
  });

  // Add to cart function with dialog functionality
  void addToCart({
    required String imgUrl,
    required String price,
    required String title,
    required String subtitle,
    required BuildContext context,
  }) {
    // Corrected 'isInCart' check with equality operator (==)
    bool isInCart = cartItems.any((e) => e["title"] == title);

    if (isInCart) {
      // Show a dialog if the item is already in the cart
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Already in Cart"),
            content: Text("$title is already in your cart."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      // Add the item to the cart if it's not in the cart already
      cartItems.add({
        "imgUrl": imgUrl,
        "price": price,
        "title": title,
        "subtitle": subtitle,
      });

      // Show a dialog confirming that the item was added
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Added to Cart"),
            content: Text("$title has been added to your cart."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );

      print("Item has been added");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Detail")),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  imgUrl,
                  width: double.infinity,
                  height: 150,
                ),
                Text("Name of this product: $title"),
                Text("Description of this product: $subtitle"),
                Text("Price of this product: $price"),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 15,
            right: 15,
            child: FilledButton(
              onPressed: () {
                // Call the addToCart function
                addToCart(
                  imgUrl: imgUrl,
                  price: price,
                  title: title,
                  subtitle: subtitle,
                  context: context,
                );
              },
              child: Text("ADD TO CART"),
            ),
          ),
        ],
      ),
    );
  }
}
