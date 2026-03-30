import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import '../widgets/custom_button.dart';
import 'welcome_page.dart';

class FoodPage extends StatelessWidget {
  final String foodType;

  const FoodPage({super.key, required this.foodType});

  @override
  Widget build(BuildContext context) {
    final List<Restaurant> restaurants = [
      Restaurant(name: "Taj Mahal", foodType: "Indian", chefOrigin: "Local"),
      Restaurant(
        name: "Curry House",
        foodType: "Indian",
        chefOrigin: "Foreign",
      ),
      Restaurant(name: "Spice India", foodType: "Indian", chefOrigin: "Local"),
      Restaurant(
        name: "Pasta Italia",
        foodType: "Italian",
        chefOrigin: "Local",
      ),
      Restaurant(
        name: "Sushi Tokyo",
        foodType: "Japanese",
        chefOrigin: "Local",
      ),
    ];

    final List<Restaurant> filtered = restaurants
        .where((r) => r.foodType.toLowerCase() == foodType.toLowerCase())
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text("$foodType Restaurants")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final r = filtered[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(r.name),
                      subtitle: Text("Chef: ${r.chefOrigin}"),
                    ),
                  );
                },
              ),
            ),
            CustomButton(
              text: "Go to Home page",
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomePage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
