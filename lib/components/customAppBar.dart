import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            Scaffold.of(context).openEndDrawer();
          }
        )
      ],
      leading: IconButton(
        onPressed: () {}, 
        icon: Icon(Icons.arrow_back)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
