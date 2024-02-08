import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_recipeapp/model.dart';
import 'package:my_recipeapp/webpage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Recipe> recipes = [];
  late String searchText;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    searchText = '';
  }

  Future<void> searchRecipes(String query) async {
    setState(() {
      isLoading = true;
    });
    try {
      final url = "https://api.edamam.com/search?q=$query&app_id=ebb6041c&app_key=3c33ad913ab23b8554082bfb5fdd78b5";
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        List<dynamic> hits = data['hits'];
        List<Recipe> tempRecipes = hits.map((hit) {
          return Recipe(
            url: hit['recipe']['url'],
            image: hit['recipe']['image'],
            source: hit['recipe']['source'],
            label: hit['recipe']['label'],
          );
        }).toList();
        setState(() {
          recipes = tempRecipes;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget _buildTextField() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        onChanged: (value) {
          setState(() {
            searchText = value;
          });
        },
        onSubmitted: (value) {
          if (searchText.isNotEmpty) {
            searchRecipes(searchText);
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          suffixIcon: IconButton(
            onPressed: () {
              if (searchText.isNotEmpty) {
                searchRecipes(searchText);
              }
            },
            icon: Icon(Icons.search),
          ),
          hintText: "Search For Recipe",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.2),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Recipe",
          style: TextStyle(
            fontSize: 20, // Set the font size to 20
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildTextField(), // Call _buildTextField() here
          Expanded(
            child: isLoading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : recipes.isNotEmpty
                ? GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebPage(url: recipe.url),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          recipe.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red, // Set the color to red
                          ),
                          onPressed: () {
                            // Implement favorite functionality
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          color: Colors.black.withOpacity(0.6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recipe.label,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Source: ${recipe.source}",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
                : Center(
              child: Text('No recipes found!'),
            ),
          ),
        ],
      ),
    );
  }
}
