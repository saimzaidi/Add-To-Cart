import 'package:cart/screens/cart.dart';
import 'package:cart/screens/detail.dart';
import 'package:cart/widgets/box.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 208, 208),
      appBar: AppBar(title: Text("Medical Products Shop"), actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartPage()));
            },
            icon: Icon(Icons.shopping_bag))
      ]),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Box(
                        imgUrl: "assets/images/product.png",
                        price: "100",
                        title: "Injection",
                        subtitle: "For kids and Mens"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductDetail(
                              imgUrl: "assets/images/product.png",
                              price: "100",
                              title: "Injection",
                              subtitle: "For kids and Mens")));
                    },
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    child: Box(
                        imgUrl: "assets/images/product.png",
                        price: "200",
                        title: "Blood",
                        subtitle: "For kids and Girls"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductDetail(
                              imgUrl: "assets/images/product.png",
                              price: "200",
                              title: "Blood",
                              subtitle: "For kids and Girls")));
                    },
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Box(
                        imgUrl: "assets/images/product.png",
                        price: "300",
                        title: "Thermometer",
                        subtitle: "For kids and Mens"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductDetail(
                              imgUrl: "assets/images/product.png",
                              price: "300",
                              title: "Thermometer",
                              subtitle: "For kids and Mens")));
                    },
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    child: Box(
                        imgUrl: "assets/images/product.png",
                        price: "400",
                        title: "Panadol",
                        subtitle: "For kids and Girls"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductDetail(
                              imgUrl: "assets/images/product.png",
                              price: "400",
                              title: "Panadol",
                              subtitle: "For kids and Girls")));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
