import 'package:flutter/material.dart';
import 'package:flutter_web_practice/helper/util/appStyle.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;

  const InfoCard({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal:  16,vertical: 8),
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.black),
          SizedBox(height: 10),
          Text(
            title,
            style: h2,
          ),
          SizedBox(height: 5),
          Text(
            subtitle,
            style: small,
          ),
          if (description.isNotEmpty) ...[
            SizedBox(height: 10),
            Text(
              description,
              style: small,
              textAlign: TextAlign.center,
            ),
          ]
        ],
      ),
    );
  }
}