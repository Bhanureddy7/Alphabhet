import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  final allAlphabets = List.generate(26, (index) => String.fromCharCode('A'.codeUnitAt(0) + index));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Center(
            child: Text('Alphabets',
            style: TextStyle(fontSize: 30),),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bhanu.jpeg'), // Set your background image path
              fit: BoxFit.cover, // You can adjust the fit as needed
            ),
          ),
          child: Center(
            child: GestureDetector(
              onTap: () {
                // You can add audio functionality here.
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.volume_up,
                    size: 60.0,
                    color: Colors.black,
                  ),
                  SizedBox(height: 20),
                  Text(
                    allAlphabets[currentIndex],
                    style: TextStyle(fontSize: 100.0,color: Colors.white),

                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30.0,
          currentIndex: 1,
          backgroundColor: Colors.green,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back),
              label: 'Previous',
              backgroundColor: Colors.green,

            ),
            BottomNavigationBarItem(
              icon: Transform.scale(
                scale: 2.0, // Increase the scale factor to make the icon larger
                child: Icon(Icons.home),
              ),
              label: 'Home',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward),
              label: 'Next',
              backgroundColor: Colors.blue,

            ),
          ],
          onTap: (int index) {
            int newIndex = currentIndex;

            if (index == 0) {
              // Previous button
              newIndex = (currentIndex - 1) % allAlphabets.length;
              if (newIndex < 0) {
                newIndex = allAlphabets.length - 1;
              }
            } else if (index == 2) {
              // Next button
              newIndex = (currentIndex + 1) % allAlphabets.length;
            }

            setState(() {
              currentIndex = newIndex;
            });
          },
        ),
      ),
    );
  }
}
