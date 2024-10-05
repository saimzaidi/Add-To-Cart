import 'package:cart/screens/detail.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  List counters = List<int>.filled(
      cartItems.length, 1);

  @override
  Widget build(BuildContext context) {

        num totalAmount = 0;
  for (int i = 0; i < cartItems.length; i++) {
    totalAmount += int.parse(cartItems[i]["price"]) * counters[i];
  }

    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "There are ${cartItems.length} items in your cart",
                  style: TextStyle(color: Color.fromRGBO(9, 15, 71, 0.45)),
                ),
                Text(
                  "Add More",
                  style: TextStyle(color: Color(0xff4157FF)),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Use Expanded to ensure ListView takes available space
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length, // Number of cart items
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Image.asset(cartItems[index]["imgUrl"])
                                ],
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(cartItems[index]["title"],
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                    Text(cartItems[index]["subtitle"],
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                9, 15, 71, 0.45))),
                                    SizedBox(height: 15),

                                    // Price calculation based on individual counter
                                    Text(
                                      "Rs. ${int.parse(cartItems[index]["price"]) * counters[index]}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                        Container(
                          height: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.cancel),
                                onPressed: () {
                                  setState(() {
                                    cartItems.removeAt(index);
                                  });
                                },
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F7FE),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Minus Button
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE5E8FB),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (counters[index] > 1) {
                                              counters[
                                                  index]--; // Decrease the counter for the specific product
                                            }
                                          });
                                        },
                                        icon: Icon(Icons.remove,
                                            color: Color(0xFF5D6EF7)),
                                      ),
                                    ),
                                    SizedBox(width: 10),

                                    // Counter Text
                                    Text(
                                      '${counters[index]}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 10),

                                    // Plus Button
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF8C9DF8),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            counters[
                                                index]++; // Increase the counter for the specific product
                                          });
                                        },
                                        icon: Icon(Icons.add,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Amount: ", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, fontWeight: FontWeight.w500, color: Color.fromRGBO(9, 15, 71, 0.45))),
                  Text("Rs. ${totalAmount}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color:  Color(0xff4157FF)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
