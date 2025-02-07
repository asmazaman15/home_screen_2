import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  // List of icon images
  final List<String> iconImages = [
    'assets/weather.png',
    'assets/clock.png',
    'assets/calendar.png',
    'assets/themestore.png',
    'assets/music.png',
    'assets/videos.png',
    'assets/myfiles.png',
    'assets/phonemanager.png',
    'assets/photos.png',
    'assets/files.png',
    'assets/musicparty.png',
    'assets/gamespace.png',
    'assets/ytmusic.png',
    'assets/daraz.png',
    'assets/myoppo.png',
    'assets/linkedin.png',
    'assets/call.png',
    'assets/message.png',
    'assets/camera.png',
    'assets/screenlock.png', // Image for last row icons
  ];

  // List of app names corresponding to the icons
  final List<String> appNames = [
    'Weather',
    'Clock',
    'Calendar',
    'Theme Store',
    'Music',
    'Videos',
    'My Files',
    'Phone Manager',
    'Photos',
    'Files',
    'Music Party',
    'Game Space',
    'YT Music',
    'Daraz',
    'My OPPO',
    'LinkedIn',
    'Call',
    'Message',
    'Camera',
    'Screen Lock', // Names for last row icons
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpg'), // Background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Icons Layout
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30), // Slightly reduced top margin
                // First 4 lines of icons
                for (int i = 0; i < 4; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9.5), // vertical padding
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Ensures even spacing between icons
                      children: List.generate(4, (index) {
                        int iconIndex = (i * 4) + index;
                        return buildIcon(iconIndex);
                      }),
                    ),
                  ),
                SizedBox(
                    height: 150), // Reduced space between upper icons and bottom icons
                // Last line of 4 icons
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      int iconIndex = 16 + index;
                      if (iconIndex < iconImages.length) {
                        return buildIcon(iconIndex);
                      } else {
                        return buildIcon(0); // Default image if out of range
                      }
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIcon(int index) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Keeps alignment consistent
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(iconImages[index % iconImages.length]),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        SizedBox(height: 5),
        Text(
          appNames[index % appNames.length], // Fetch name dynamically
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}