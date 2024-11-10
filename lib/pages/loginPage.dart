import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, // Set the background color to red
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Welcome to the Login Page',
              style: TextStyle(
                color: Colors.white, // Text color set to white for contrast
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Please log in to continue.',
              style: TextStyle(
                color: Colors.white, // Text color set to white for contrast
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
