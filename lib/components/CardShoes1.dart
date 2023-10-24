import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardShoes1 extends StatelessWidget {
  final title;
  final price;
  final category;

  const CardShoes1({
    super.key,
    required this.title,
    required this.price,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Color(0xffECEDEF), borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/image/sepatu1.png',
            width: 150,
          ),
          Text(
            category,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            maxLines: 2,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
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
      ),
    );
  }
}
