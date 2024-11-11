import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart'; // For date formatting

import '../blocs/bloc/user_bloc.dart';
import '../blocs/bloc/user_event.dart';
import '../blocs/bloc/user_state.dart';
import './../../database/databaseManger.dart';

class ProfilePage extends StatelessWidget {
  final int? userId;

  const ProfilePage({super.key, required this.userId});

  // Method to format DateTime into a human-readable string
  String formatDate(DateTime dateTime) {
    return DateFormat('MMMM dd, yyyy').format(dateTime); // Customize format as needed
  }

  @override
  Widget build(BuildContext context) {
    // Handle the case where userId is null early
    if (userId == null) {
      return Scaffold(body: Center(child: Text('Invalid User ID')));
    }

    return BlocProvider(
      create: (context) => UserBloc(DatabaseHelper())..add(FetchUser(userId: userId!)),
      child: Scaffold(
        backgroundColor: Colors.white, 
        appBar: AppBar(
          title: null,
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is Error) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is UserFetched) {
              final user = state.user;

              if (user == null) {
                return Center(child: Text('User not found'));
              }

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white, // Background color for the image container
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 4,
                                  blurRadius: 8,
                                  offset: Offset(0, 4), // Shadow position
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.grey.shade300,
                              child: ClipOval(
                                child: user.imageUrl != null
                                    ? Image.network(
                                        user.imageUrl!,
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                        loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          } else {
                                            return Center(child: CircularProgressIndicator());
                                          }
                                        },
                                        errorBuilder: (context, error, stackTrace) {
                                          return Icon(Icons.person, size: 200, color: Colors.white);
                                        },
                                      )
                                    : Icon(Icons.person, size: 200, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 16), 
                          Text(
                            user.fullName ?? 'Unknown', 
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10), 
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: Offset(0, 3), 
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person, size: 24, color: Colors.black),
                              SizedBox(width: 8),
                              Text(
                                user.fullName ?? 'Unknown',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.email, size: 24, color: Colors.black),
                              SizedBox(width: 8),
                              Text(
                                user.email ?? 'Not available',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.phone, size: 24, color: Colors.black),
                              SizedBox(width: 8),
                              Text(
                                user.phoneNo ?? 'Not available',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.work, size: 24, color: Colors.black),
                              SizedBox(width: 8),
                              Text(
                                user.jobPosition ?? 'Not available',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.school, size: 24, color: Colors.black),
                              SizedBox(width: 8),
                              Text(
                                user.school ?? 'Not available',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.cake, size: 24, color: Colors.black),
                              SizedBox(width: 8),
                              Text(
                                user.birthdate != null ? formatDate(user.birthdate!) : 'Not available',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.home, size: 24, color: Colors.black),
                              SizedBox(width: 8),
                              Text(
                                user.address ?? 'Not available',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }
}