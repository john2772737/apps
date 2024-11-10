import 'package:flutter/material.dart';
import 'package:app/components/CustomTextFormField.dart';
import 'package:go_router/go_router.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<Registerpage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers for the first form
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Controllers for the second form
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _email2Controller = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _jobpositionController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  bool _isRegisterPage2 = false; // Flag to toggle between forms

  @override
  void dispose() {
    // Dispose all controllers
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullnameController.dispose();
    _email2Controller.dispose();
    _phonenumberController.dispose();
    _jobpositionController.dispose();
    _schoolController.dispose();
    _birthdateController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Positioned(
                    left: -250,
                    top: 440,
                    child: Image.asset(
                      'assets/images/circle.png',
                      width: 600,
                      height: 600,
                    ),
                  ),
                  Positioned(
                    top: 65,
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
                    child: _isRegisterPage2 ? _buildRegisterPage2() : _buildRegisterPage1(),
                  ),
                ],
              ),
            ),
            // Back button positioned in the main Scaffold build
            Positioned(
              top: 30,
              left: 15,
              child: GestureDetector(
                onTap: () {
                  if (_isRegisterPage2) {
                    setState(() {
                      _isRegisterPage2 = false; // Go back to Page 1
                    });
                  } else {
                    GoRouter.of(context).pop(); // Go back to the previous screen
                  }
                },
                child: Image.asset(
                  'assets/images/arrow.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterPage1() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 240),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.45,
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
                padding: const EdgeInsets.only(left: 25, top: 30.0, bottom: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Create your Account',
                    style: TextStyle(
                      fontFamily: 'LeagueSpartan',
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
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
              CustomTextFormField(
                label: 'Re-enter password',
                controller: _confirmPasswordController,
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 130, top: 0),
                child: SizedBox(
                  width: 100,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isRegisterPage2 = true;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFA33BD1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterPage2() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 130),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.75,
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
                padding: const EdgeInsets.only(left: 25, top: 17.0, bottom: 13),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Complete your Account',
                    style: TextStyle(
                      fontFamily: 'LeagueSpartan',
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              CustomTextFormField(
                label: 'Fullname',
                controller: _fullnameController,
              ),
              CustomTextFormField(
                label: 'Email',
                controller: _email2Controller,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                label: 'Phone number',
                controller: _phonenumberController,
              ),
              CustomTextFormField(
                label: 'Job position',
                controller: _jobpositionController,
              ),
              CustomTextFormField(
                label: 'School',
                controller: _schoolController,
              ),
              CustomTextFormField(
                label: 'Birthdate',
                controller: _birthdateController,
              ),
              CustomTextFormField(
                label: 'Address',
                controller: _addressController,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 130, top: 0),
                child: SizedBox(
                  width: 100,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push('/uploadimage');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFA33BD1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
