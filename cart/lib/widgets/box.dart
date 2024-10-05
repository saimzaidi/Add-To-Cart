import 'package:flutter/material.dart';

Widget Box({required imgUrl, required title, required subtitle, required price}) {
  return Container(
    width: 160,
    height: 240,
    child: Column(
      children: [
        Container(
          width: double.infinity,
          height: 140,
          decoration: BoxDecoration(
              color: Color(0xffEEEEF0),
              image: DecorationImage(
                image: AssetImage(imgUrl),
                fit: BoxFit.contain,
              ),
              borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(12), topStart: Radius.circular(12))),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 10),
          height: 96,
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(12),
                  bottomStart: Radius.circular(12)),
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Text(title,
                  style: TextStyle(fontSize: 16, color: Color(0xff090F47))),
              SizedBox(height: 5),
              Text(subtitle,
                  style: TextStyle(fontSize: 13, color: Color(0xff090F47))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Rs. ${price}",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  Image.asset("assets/images/rating_label.png")
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
