import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 142,
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: ShapeDecoration(
            color: Color(0xFF3B4D93),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'تسجيل دخول',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0.09,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
