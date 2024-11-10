import 'package:flutter/material.dart';
import 'package:app/components/CustomTextFormField.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

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
              left: (screenWidth - 600) / 2,
              top: -130,
              child: Image.asset(
                'assets/images/circle.png',
                width: 600,
                height: 600,
              ),
            ),
            Positioned(
              left: (screenWidth - 200) / 2,
              top: 170,
              child: Image.asset(
                'assets/images/logo.png',
                width: 200,
                height: 200,
              ),
            ),
            // The content (form) on top of the background image
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 300),
                child: Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.45,
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0, bottom: 40),
                          child: Text(
                            'We Vibe!',
                            style: TextStyle(
                              fontFamily: 'Lemon',
                              fontSize: 27.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFA33BD1),
                            ),
                          ),
                        ),
                        CustomTextFormField(
                          label: 'Username',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        CustomTextFormField(
                          label: 'Password',
                          controller: _passwordController,
                          obscureText: true,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 50.0, top: 0),
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                fontFamily: 'LeagueSpartan',
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        // Centered Row with Login button and "Don't have an account?" text
                        Padding(
                          padding: const EdgeInsets.only(top:10.0, left: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  fontFamily: 'LeagueSpartan',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 10),
                              TextButton(
                                onPressed: () {
                                  // Navigate to the register page when "Sign Up" is pressed
                                  GoRouter.of(context).push('/registerPage');
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
