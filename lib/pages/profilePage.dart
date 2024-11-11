import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart'; // Add this import for Date formatting
import '../components/customProfile.dart';
import '../components/ProfileDetails.dart';
import '../components/customHighlight.dart';
import 'dart:ui';
import 'dart:typed_data';

import '../blocs/bloc/user_bloc.dart';
import '../blocs/bloc/user_event.dart';
import '../blocs/bloc/user_state.dart';
import './../../database/databaseManger.dart';

class Profilepage extends StatelessWidget {
  final int? userId;

  const Profilepage({super.key, required this.userId});

  // Method to format DateTime into a human-readable string
  String formatDate(DateTime dateTime) {
    return DateFormat('MMMM dd, yyyy')
        .format(dateTime); // Customize format as needed
  }

  @override
  Widget build(BuildContext context) {
    // Handle the case where userId is null early
    if (userId == null) {
      return Scaffold(body: Center(child: Text('Invalid User ID')));
    }

    double screenWidth = MediaQuery.of(context).size.width;
    ScrollController _scrollController = ScrollController();

    return BlocProvider(
      create: (context) => UserBloc(DatabaseHelper())
        ..add(FetchUser(userId: userId!)), // Fetch user data on page load
      child: Scaffold(
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is Loading) {
              return Center(
                  child: CircularProgressIndicator()); // Loading state
            } else if (state is Error) {
              return Center(
                  child: Text('Error: ${state.message}')); // Error state
            } else if (state is UserFetched) {
              final user = state.user; // Your fetched user data

              if (user == null) {
                return Center(child: Text('User not found'));
              }

              // Check if the image is available and store it as a byte array (BLOB)
              Uint8List? userImageBytes =
                  user.imageUrl; // Assuming 'image' is a BLOB field

              return SingleChildScrollView(
                controller: _scrollController,
                child: SizedBox(
                  height: 1500,
                  child: Stack(
                    children: [
                      Container(
                        width: screenWidth,
                        color: Colors.white,
                      ),
                      AnimatedBuilder(
                        animation: _scrollController,
                        builder: (context, child) {
                          double offset = _scrollController.hasClients
                              ? _scrollController.offset
                              : 0.0;
                          double blurAmount = offset < 100 ? 0.0 : offset / 10;

                          return CustomProfile(
                            image: userImageBytes != null
                                ? Image.memory(
                                    userImageBytes) // Use memory image if BLOB is not null
                                : Image.asset(
                                    'assets/images/default_profile.jpg'), // Default image if no BLOB
                            name: user.fullName ?? 'Unknown',
                            position:
                                user.jobPosition ?? 'Position not available',
                            imageEffect: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                  sigmaX: blurAmount, sigmaY: blurAmount),
                              child: child!,
                            ),
                          );
                        },
                        child: CustomProfile(
                          image: userImageBytes != null
                              ? Image.memory(
                                  userImageBytes) // Use memory image if BLOB is not null
                              : Image.asset(
                                  'assets/images/default_profile.jpg'), // Default image if no BLOB
                          name: user.fullName ?? 'Unknown',
                          position:
                              user.jobPosition ?? 'Position not available',
                        ),
                      ),
                      AnimatedBuilder(
                        animation: _scrollController,
                        builder: (context, child) {
                          double offset = _scrollController.hasClients
                              ? _scrollController.offset
                              : 0.0;
                          double additionalCircleOpacity =
                              offset > 100 ? (offset - 100) / 50 : 0.0;

                          return Positioned(
                            top: 300,
                            left: (screenWidth - 250) / 2,
                            child: Opacity(
                              opacity: additionalCircleOpacity.clamp(0.0, 1.0),
                              child: Container(
                                width: 250,
                                height: 250,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                ),
                                child: ClipOval(
                                  child: userImageBytes != null
                                      ? Image.memory(
                                          userImageBytes,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          'assets/images/default_profile.jpg'), // Default image if no BLOB
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Positioned(
                        top: 640,
                        left: 40,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Add Highlight",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4F1787),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 640,
                        right: 40,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Edit Profile",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4F1787),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 700,
                        left: 20,
                        right: 20,
                        child: ProfileDetails(
                          name: user.fullName ?? 'Unknown',
                          email: user.email ?? 'Not available',
                          number: user.phoneNo ?? 'Not available',
                          position: user.jobPosition ?? 'Not available',
                          school: user.school ?? 'Not available',
                          birthday: user.birthdate != null
                              ? formatDate(user.birthdate!)
                              : 'Not available', // Format the DateTime
                          address: user.address ?? 'Not available',
                        ),
                      ),
                      Positioned(
                        top: 1050,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Highlights",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: Colors.black),
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                thickness: 1,
                                indent: 20,
                                endIndent: 20,
                              ),
                              Expanded(
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: const [
                                    CustomHighlight(
                                      image: 'assets/images/raprap.jpg',
                                      hlName: 'DHVSU',
                                    ),
                                    SizedBox(width: 5),
                                    CustomHighlight(
                                      image: 'assets/images/raprap.jpg',
                                      hlName: 'FOODTRIP',
                                    ),
                                    SizedBox(width: 5),
                                    CustomHighlight(
                                      image: 'assets/images/raprap.jpg',
                                      hlName: 'DOGS',
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
