import 'package:flutter/material.dart';
import 'package:my_recipeapp/favorites.dart';
import 'package:my_recipeapp/home.dart';
import 'package:my_recipeapp/profile.dart';
import 'package:my_recipeapp/search.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Categories',
          style: TextStyle(
          color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16),
        childAspectRatio: 1.0,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          CategoryCard(
            title: 'Breakfast',
            icon: Icons.breakfast_dining,
            onTap: () {
              // Implement action when Breakfast category is tapped
            },
          ),
          CategoryCard(
            title: 'Lunch',
            icon: Icons.local_dining,
            onTap: () {
              // Implement action when Lunch category is tapped
            },
          ),
          CategoryCard(
            title: 'Dinner',
            icon: Icons.dinner_dining,
            onTap: () {
              // Implement action when Dinner category is tapped
            },
          ),
          CategoryCard(
            title: 'Desserts',
            icon: Icons.cake,
            onTap: () {
              // Implement action when Desserts category is tapped
            },
          ),
          // Add more CategoryCard widgets for additional categories
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black, // Set unselected item color to black
        currentIndex: 3, // Set the current index to 3 for Categories page
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage()
                ),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesPage(),
                ),
              );
              break;
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
              break;
          }
        },
      ),

    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const CategoryCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: Colors.blue,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
