import 'package:flutter/material.dart';
import '../components/customProfile.dart';
import '../components/ProfileDetails.dart';
import '../components/customHighlight.dart';
import 'dart:ui';  

class Profilepage extends StatelessWidget {
  
  const Profilepage({super.key,final int? userId});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    ScrollController _scrollController = ScrollController();

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
                  image: 'assets/images/raprap.jpg',
                  name: 'Ralph De Guzman',
                  position: 'UI/UX DESIGNER',
                  imageEffect: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: blurAmount, sigmaY: blurAmount),
                    child: child!,
                  ),
                );
              },
              child: CustomProfile(
                image: 'assets/images/raprap.jpg',
                name: 'Ralph De Guzman',
                position: 'UI/UX DESIGNER',
              ),
            ),

            AnimatedBuilder(
              animation: _scrollController,
              builder: (context, child) {
                double offset = _scrollController.hasClients
                    ? _scrollController.offset
                    : 0.0;
                double additionalCircleOpacity = offset > 100 ? (offset - 100) / 50 : 0.0;

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
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/raprap.jpg',
                          fit: BoxFit.cover,
                        ),
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
                name: 'Ralph De Guzman',
                email: 'jane.doe@example.com',
                number: '123-456-7890',
                position: 'Student',
                school: 'ABC University',
                birthday: '11-27-2002',
                address: 'Porac, Pampanga',
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
                            color: Colors.black
                        ),
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
  }
}
