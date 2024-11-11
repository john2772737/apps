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
      create: (context) => UserBloc(DatabaseHelper())..add(FetchUser(userId: userId!)), // Fetch user data on page load
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is Loading) {
              return Center(child: CircularProgressIndicator()); // Loading state
            } else if (state is Error) {
              return Center(child: Text('Error: ${state.message}')); // Error state
            } else if (state is UserFetched) {
              final user = state.user; // Your fetched user data

              if (user == null) {
                return Center(child: Text('User not found'));
              }

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User Image with Loading Indicator
                    user.imageUrl != null
                        ? CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey.shade300,
                            child: ClipOval(
                              child: Image.network(
                                user.imageUrl!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    // Image has finished loading
                                    return child;
                                  } else {
                                    // Show a CircularProgressIndicator while loading
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  // Show a fallback icon if the image fails to load
                                  return Icon(Icons.person, size: 50, color: Colors.white);
                                },
                              ),
                            ),
                          )
                        : CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.person, size: 50, color: Colors.white),
                          ),
                    SizedBox(height: 16),

                    // User Information
                    Text(
                      'Name: ${user.fullName ?? 'Unknown'}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Email: ${user.email ?? 'Not available'}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Phone: ${user.phoneNo ?? 'Not available'}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Position: ${user.jobPosition ?? 'Not available'}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'School: ${user.school ?? 'Not available'}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Birthday: ${user.birthdate != null ? formatDate(user.birthdate!) : 'Not available'}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Address: ${user.address ?? 'Not available'}',
                      style: TextStyle(fontSize: 16),
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
