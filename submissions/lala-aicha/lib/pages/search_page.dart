import 'package:flutter/material.dart';
import 'food_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  List<String> suggestions = [];

  final Map<String, List<String>> foodOptions = {
    'Indian': ['Taj Mahal', 'Curry House', 'Spice India'],
    'Italian': ['Pasta italia', 'Pizza Bella', 'Trattoria'],
    'Japanese': ['Sushi Tokyo', 'Ramen House', 'Sakura'],
  };

  void updateSuggestions(String input) {
    setState(() {
      suggestions = foodOptions.keys
          .where((key) => key.toLowerCase().contains(input.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Food")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: "Enter food type",
                border: OutlineInputBorder(),
              ),
              onChanged: updateSuggestions,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: suggestions.length,
                itemBuilder: (context, index) {
                  String suggestion = suggestions[index];
                  return ListTile(
                    title: Text(suggestion),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodPage(foodType: suggestion),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
