import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app/pages/registerPage.dart';

class Uploadimage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Uploadimage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background Image positioned at the center
            Positioned(
              left: 100,
              top: 70,
              child: Image.asset(
                'assets/images/circle.png',
                width: 800,
                height: 800,
              ),
            ),
            // Back arrow button wrapped in GestureDetector
            Positioned(
              left: 10,
              top: 30,
              child: GestureDetector(
                onTap: () {
                  // Define your navigation or action here
                  GoRouter.of(context).pop();
                },
                child: Image.asset(
                  'assets/images/arrow.png',
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            // New Text widget positioned at the top center
            Positioned(
              top: 130,
              left: 0,
              right: 0,
              child: Text(
                'Sign Up',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Lemon",
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFA33BD1),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 200),
                child: Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(14.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 175,
                        height: 175,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey,
                            width: 4.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: 100,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to the next page
                            GoRouter.of(context).push('/registerPage2');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFA33BD1),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          child: Text(
                            'Choose',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 60),
                      Column(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 35,
                            child: ElevatedButton(
                              onPressed: () {
                                GoRouter.of(context).push('/registerPage2');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontFamily: 'LeagueSpartan',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
