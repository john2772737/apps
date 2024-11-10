import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  final String name;
  final String email;
  final String number;
  final String position;
  final String school;
  final String birthday;
  final String address;

  const ProfileDetails({
    super.key,
    required this.name,
    required this.email,
    required this.number,
    required this.position,
    required this.school,
    required this.birthday,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Title
          const Text(
            'Profile Details',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5.0),


          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),

          // Name Row with Icon
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                const Icon(Icons.person),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontFamily: "LeagueSpartan",
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                const Icon(Icons.phone),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    number,
                    style: const TextStyle(
                      fontFamily: "LeagueSpartan",
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                const Icon(Icons.email),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    email,
                    style: const TextStyle(
                      fontFamily: "LeagueSpartan",
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                const Icon(Icons.work),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    position,
                    style: const TextStyle(
                      fontFamily: "LeagueSpartan",
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                const Icon(Icons.school),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    school,
                    style: const TextStyle(
                      fontFamily: "LeagueSpartan",
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                const Icon(Icons.cake),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    birthday,
                    style: const TextStyle(
                      fontFamily: "LeagueSpartan",
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                const Icon(Icons.location_on),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    address,
                    style: const TextStyle(
                      fontFamily: "LeagueSpartan",
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}