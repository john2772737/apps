import 'package:flutter/material.dart';
import 'dart:ui';

class CustomProfile extends StatelessWidget {
  final String image;
  final String name;
  final String position;
  final Widget? imageEffect; 

  const CustomProfile({
    super.key,
    required this.image,
    required this.name,
    required this.position,
    this.imageEffect, 
  });

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        Positioned(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.75,
          child: imageEffect ?? Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 500,
          left: (MediaQuery.of(context).size.width - 500) / 2,
          child: Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
            ),
          ),
        ),

        Positioned(
          top: 550,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          )
        ),

        Positioned(
          top: 600,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              position,
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF55679C)
              ),
            ),
          )
        )
      ],
    );
  }
}