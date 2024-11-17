import 'package:flutter/material.dart';
import 'package:food_delivery/components/common_text.dart';

horizontalView(IconData data, String text, {Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(data),
          const SizedBox(width: 30),
          CommonText(
            text: text,
          )
        ],
      ),
    ),
  );
}
