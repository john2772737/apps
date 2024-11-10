import 'package:flutter/material.dart';

class CustomHighlight extends StatelessWidget {
  final String image;
  final String hlName;
  const CustomHighlight({
    super.key,
    required this.image,
    required this.hlName,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width ;

    return Stack(
      children: [
        Container(
          width: screenWidth * 0.5,
        ),
        Positioned(
          top: 0,
          left: 15,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image,
                  width: MediaQuery.of(context).size.width * 0.40,
                  height: MediaQuery.of(context).size.height * 0.25,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 8.0,),
              Padding(
                padding: const EdgeInsets.only(top: 250),
                child: Text(
                  hlName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
