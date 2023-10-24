import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerShoes extends StatelessWidget {
  final title;
  final price;
  final category;

  const ContainerShoes({
    super.key,
    required this.title,
    required this.price,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 110,
          height: 100,
          decoration: BoxDecoration(
              color: Color(0xffECEDEF),
              borderRadius: BorderRadius.circular(10)),
          child: Image.asset(
            'assets/image/sepatu1.png',
            width: 10,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 4),
            Container(
              width: 230,
              child: Text(
                title,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  CupertinoIcons.money_dollar,
                  color: Colors.blue,
                  size: 17,
                ),
                Text(
                  price.toString(),
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
