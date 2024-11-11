import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/bloc/user_bloc.dart';
import '../blocs/bloc/user_event.dart';
import '../blocs/bloc/user_state.dart';
import './../../database/databaseManger.dart'; // Make sure this path is correct
import '../components/CustomTextFormField.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => UserBloc(DatabaseHelper()), // Injecting DatabaseHelper here
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
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
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 30),
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
                                    GoRouter.of(context).push('/registerPage');
                                    print('s button pressed');
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
                          BlocConsumer<UserBloc, UserState>(
                            listener: (context, state) {
                              state.when(
                                success: (userId) {
                                  print("Login successful, user ID: $userId");
                                  // Navigate to the home page or another screen after successful login
                                  GoRouter.of(context).push('/profilePage',extra: userId);
                                },
                                error: (errorMessage) {
                                  // Show an error message in case of login failure
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(errorMessage)),
                                  );
                                },
                                loading: () {},
                                initial: () {},
                                userFetched: (_) {},
                                
                              );
                            },
                            builder: (context, state) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    print('Login button pressed');
                                    if (_formKey.currentState!.validate()) {
                                      final email = _emailController.text;
                                      final password = _passwordController.text;
                                      context.read<UserBloc>().add(
                                        UserEvent.submit(email: email, password: password),
                                      );
                                    }
                                  },
                                  child: Text('Login'),
                                ),
                              );
                            },
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
      ),
    );
  }
}
