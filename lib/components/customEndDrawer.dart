import 'package:flutter/material.dart';

class CustomEndDrawer extends StatelessWidget {
  final bool isLoggedIn;
  final List<Map<String, dynamic>> menuItems;
  final String title;

  const CustomEndDrawer({
    Key? key,
    required this.isLoggedIn,
    required this.menuItems,
    this.title = "We Vibe!",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //padding: EdgeInsets.all(16),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFA33BD1),
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
            ),
            )
          ),
          ...menuItems.map((item) {
            return ListTile(
              leading: Icon(item['icon']),
              title: Text(item['title']),
            );
          }).toList(),

          // Logout option (only if the user is logged in)
          if (isLoggedIn)
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {},
            ),
        ],
      ),
    );
  }
}
