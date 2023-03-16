import 'package:flutter/material.dart';

class SectionSubTitle extends StatelessWidget {
  const SectionSubTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 18,
          color: Colors.grey.shade500,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
