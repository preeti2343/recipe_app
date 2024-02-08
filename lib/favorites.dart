import 'package:flutter/material.dart';
import 'package:my_recipeapp/search.dart';
import 'package:my_recipeapp/profile.dart';
import 'package:my_recipeapp/categories.dart';
import 'package:my_recipeapp/home.dart'; // Import the Home class

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24, // Increase font size
          ),
        ),
        backgroundColor: Colors.red,
        elevation: 0, // Remove app bar elevation
      ),
      body: ListView.builder(
        itemCount: 10, // Assuming you have 10 favorite items
        itemBuilder: (BuildContext context, int index) {
          // Replace this placeholder URL with your actual image URLs
          String imageUrl = 'https://via.placeholder.com/150';
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Add padding around list items
            child: Card(
              elevation: 2, // Add elevation to list items
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl), // Set item image
                ),
                title: Text(
                  'Favorite Item ${(index + 1)}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Description of Favorite Item ${(index + 1)}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Implement deletion logic here
                  },
                ),
                onTap: () {
                  // Implement navigation to item detail page here
                },
              ),
            ),
          );
        },
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
        currentIndex: 2, // Set the current index to 2 for Favorites page
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
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
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoriesPage(),
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
