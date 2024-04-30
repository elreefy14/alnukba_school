import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomContainer extends StatelessWidget {
  final String svgPath;
  final String title;

  CustomContainer({required this.svgPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(12),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: SizedBox(
          height: 80,  // Reduced height by 20
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 56,
                padding: const EdgeInsets.all(3),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: SvgPicture.asset(svgPath, width: 50, height: 59.32),
              ),
              const SizedBox(height: 5),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize:12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0.11,
                  letterSpacing: 0.04,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}