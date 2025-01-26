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
