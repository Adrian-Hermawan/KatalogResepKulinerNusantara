import 'package:flutter/material.dart';
import '../data/resep_kuliner.dart';
import '../models/resep_model.dart';
import 'detail_halaman.dart';
import 'halaman_favorit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Recipe> _recipes = dummyRecipes;

  void _toggleFavorite(Recipe recipe) {
    setState(() {
      recipe.isFavorite = !recipe.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kuliner Nusantara',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF5D4037),
        actions: [
          // Tombol Membuka Halaman Favorit
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteScreen(
                    recipes: _recipes,
                    onFavoriteToggle: _toggleFavorite,
                  ),
                ),
              );
              setState(() {});
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: _recipes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.72,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final recipe = _recipes[index];
            return GestureDetector(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      recipe: recipe,
                      onFavoriteToggle: () => _toggleFavorite(recipe),
                    ),
                  ),
                );
                setState(() {});
              },
              child: Card(
                color: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Hero(
                          tag: 'recipe_image_${recipe.id}',
                          child: Image.asset(
                            recipe.imageUrl,
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(height: 120, color: Colors.brown.shade100, child: const Icon(Icons.broken_image)),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.9),
                            radius: 18,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              iconSize: 20,
                              icon: Icon(
                                recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: recipe.isFavorite ? Colors.red : Colors.grey,
                              ),
                              onPressed: () => _toggleFavorite(recipe),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe.title,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF3E2723)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            recipe.origin,
                            style: TextStyle(color: Colors.brown.shade400, fontSize: 11),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.timer, size: 14, color: Color(0xFF8D6E63)),
                              const SizedBox(width: 4),
                              Text('${recipe.duration} mnt', style: TextStyle(fontSize: 11, color: Colors.brown.shade700)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}