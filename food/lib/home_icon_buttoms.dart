import 'package:flutter/material.dart';

class CategoryW extends StatelessWidget {
  String image;
  String text;
  Color color;
  VoidCallback onPressed;

  CategoryW(
      {required this.image,
      required this.text,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 165,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0x9F3D416E),
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 120,
              height: 120,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(color: color, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
