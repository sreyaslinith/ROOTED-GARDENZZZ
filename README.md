# ROOTED-GARDENZZZ
This app is mainly looking forward to help home maker womens within kerala .Rooted gardenzzz provide details about vegetables ,seed details ,fertilizer used and its suitable temperature also.This is a user friendly app that helps both men and  women to  involve in agricultural activity and earn income byside.
# TEAM NAME
Tech Titans 
# TEAM MEMBERS
Sreyas Linith- VAST Thrissur
Anjana m-VAST Thrissur
Anjana c-VAST Thrissur
# DESCRIPTION
a userfriendly app for gaining more details about vegetable, their seed type, fertilizers and its suitable temperature also.
# PROBLEM STATEMENT
Women constitute a substantial proportion of the agricultural workforce; yet they quite often face significant barriers to accessing information, resources and technology that could improve their farming practices and enhance productivity and farm income. This good practice note examine the challenges that women farmers face, as well as how innovative digital solutions can empower them, promote gender equality in agriculture and support sustainable agricultural practices.The hurdles that women farmers encounter limit their ability to fully participate in agriculture and benefit from the economic opportunities it provides. One of the most significant challenges they encounter is a lack of access to technology and information.for treating this probleam we introduce our app named routed gardenzzz. 
# SOLUTION 
rooted gardenzzz is an app developed for different users but mainly focus on help womens to engage in agricultural activites. it provide different varities of vegetable seed details and their seed type. there is no login provided so that user can easily ascess . we provide search bar,so that the users can easily fetch the details.this focuses on the vegetables that grow in kerala and also provide soil details .we can add more features and also use the app in android and ios.
for software: 
# LANGUAGE USED : DART
# FRAMEWORK : FLUTTER
# TOOLS USED: VS CODE
# IMPLEMENTATION: 
Step 1: Install Necessary Tools
1. Install Flutter
Download Flutter SDK from the official site:
https://docs.flutter.dev/get-started/install
Follow installation steps based on your operating system (Windows/Mac/Linux).
2. Install Visual Studio Code
Download and install VS Code from:
https://code.visualstudio.com
3. Install Flutter and Dart extensions in VS Code
Open VS Code.
Go to the Extensions tab (Ctrl + Shift + X).
Search for Flutter and install it (this will install Dart too).
4. Install an Android Emulator (if needed)
Install Android Studio from https://developer.android.com/studio.
Set up a virtual device to run your app, or use a real phone via USB debugging.B
Step 2: Create Your Flutter Project
Open VS Code.
Press Ctrl + Shift + P, then type Flutter: New Project.
Choose "Application", then name it simple_app.
Select a folder to save the project.
Wait for it to finish creating files.
Step 3: Write the App Code
1. Open the lib/main.dart file and replace its content with the following code:

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WELCOME TO ROOTED GARDENS',
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  void _searchItem() {
    String inputText = _controller.text.trim();
    if (inputText.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(item: inputText),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to Rooted Gardens')),
      backgroundColor: const Color.fromARGB(255, 202, 247, 206),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              'Welcome to Rooted Gardens!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 5, 61, 9),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Find information about your favorite vegetables.',
              style: TextStyle(
                fontSize: 19,
                color: const Color.fromARGB(255, 8, 79, 10),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Search your greens',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: _searchItem,
              child: Text('Search'),
            ),
           SizedBox(height: 40),
            Text(
              'Popular Vegetables:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 211, 243, 213),
              ),
            ),
            SizedBox(height: 20),
            // Display popular vegetable cards with images
            Wrap(
              spacing: 15,
              runSpacing: 15,
              children: [
                _buildVeggieCard('Carrot', ''),
                _buildVeggieCard('Cucumber', ''),
                _buildVeggieCard('Spinach', ''),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVeggieCard(String name, String imageUrl) {
    return GestureDetector(
      onTap: () {
        _controller.text = name; // Set the search field to the vegetable name
      },
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(imageUrl, height: 100, width: 100, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class DetailsPage extends StatelessWidget {
  final String item;
  DetailsPage({required this.item});

   final Map<String, String> itemDetails = {
    'apple': 'Apples grow well in temperate climates with full sun.',
    'banana': 'Bananas need warm temperatures and high humidity to grow.',
    'carrot': 'Carrots prefer loose, sandy soil with cool temperatures.',
    'tomato': 'Tomatoes need plenty of sunlight and well-drained soil.',
  };

  final Map<String, String> itemImages = {
  
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details for $item')),
      backgroundColor: const Color.fromARGB(255, 221, 255, 219),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              itemImages[item.toLowerCase()] ?? '',
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              itemDetails[item.toLowerCase()] ??
                  'Sorry, details not available for $item.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
Step 4: Run the App
1. Connect Your Device
Enable USB Debugging on your Android device from developer settings.
Connect your phone to the computer via USB.
Run flutter doctor in VS Code's terminal to check if everything is set up correctly.
2. Run the App
Open the VS Code terminal (Ctrl + `) and type:
shell
Copy code
flutter run
The app should start on your connected device or emulator.
Step 5: Using Your App
When the app opens, type the name of a fruit or vegetable, e.g., "apple" or "carrot".
Press the Search button.
It will take you to the next page with details about how it can be grown.
If the name is not recognized, it will show "Details not available."
Step 6: Export the App (Optional)
Once your app works, you can generate an APK to install it on any Android phone:

In the terminal, type:
shell
Copy code
flutter build apk
The APK will be generated in the build/app/outputs/flutter-apk folder.
Copy the APK to your phone and install it 
# COMMAND
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WELCOME TO ROOTED GARDENS',
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  void _searchItem() {
    String inputText = _controller.text.trim();
    if (inputText.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(item: inputText),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to Rooted Gardens')),
      backgroundColor: const Color.fromARGB(255, 202, 247, 206),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              'Welcome to Rooted Gardens!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 5, 61, 9),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Find information about your favorite vegetables.',
              style: TextStyle(
                fontSize: 19,
                color: const Color.fromARGB(255, 8, 79, 10),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Search your greens',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: _searchItem,
              child: Text('Search'),
            ),
           SizedBox(height: 40),
            Text(
              'Popular Vegetables:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 211, 243, 213),
              ),
            ),
            SizedBox(height: 20),
            // Display popular vegetable cards with images
            Wrap(
              spacing: 15,
              runSpacing: 15,
              children: [
                _buildVeggieCard('Carrot', ''),
                _buildVeggieCard('Cucumber', ''),
                _buildVeggieCard('Spinach', ''),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVeggieCard(String name, String imageUrl) {
    return GestureDetector(
      onTap: () {
        _controller.text = name; // Set the search field to the vegetable name
      },
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(imageUrl, height: 100, width: 100, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String item;
  DetailsPage({required this.item});

   final Map<String, String> itemDetails = {
    'apple': 'Apples grow well in temperate climates with full sun.',
    'banana': 'Bananas need warm temperatures and high humidity to grow.',
    'carrot': 'Carrots prefer loose, sandy soil with cool temperatures.',
    'tomato': 'Tomatoes need plenty of sunlight and well-drained soil.',
  };

  final Map<String, String> itemImages = {
  
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details for $item')),
      backgroundColor: const Color.fromARGB(255, 221, 255, 219),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              itemImages[item.toLowerCase()] ?? '',
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              itemDetails[item.toLowerCase()] ??
                  'Sorry, details not available for $item.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
# SCREENSHOTS
![WhatsApp Image 2025-01-26 at 10 34 38 AM (2)](https://github.com/user-attachments/assets/d19392e8-26eb-439c-a735-cc1167b37c10)
![WhatsApp Image 2025-01-26 at 10 34 38 AM (1)](https://github.com/user-attachments/assets/1efc233e-f56f-4b0d-a1df-f2fa9cd0a799)
![WhatsApp Image 2025-01-26 at 10 34 38 AM](https://github.com/user-attachments/assets/b2f2bc44-6c1b-451d-ab37-a6fcf2450b65)
# TEAM PHOTO
![WhatsApp Image 2025-01-26 at 10 34 26 AM](https://github.com/user-attachments/assets/e45a6333-2850-48bc-bf36-cb387db57b46)
# VIDEO


https://github.com/user-attachments/assets/439ab10b-77cd-4090-ac50-9ba812d87e08


# TEAM CONTRIBUTIONS
Sreyas Linith-building application and frontend creation
Anjana M -idea developing and processing 
Anjana c- idea developing and processing



