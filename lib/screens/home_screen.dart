import 'package:flutter/material.dart';
import '../data/resep_kuliner.dart';
import '../models/resep_model.dart';
import 'detail_screen.dart';

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
        title: const Text('Kuliner Nusantara', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: _recipes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 Kolom Grid
            childAspectRatio: 0.75,
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
                setState(() {}); // Update tampilan saat kembali
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        // Animasi Hero untuk Gambar
                        Hero(
                          tag: 'recipe_image_${recipe.id}',
                          child: Image.network(
                            recipe.imageUrl,
                            height: 130,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(height: 130, color: Colors.grey, child: const Icon(Icons.broken_image)),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.8),
                            child: IconButton(
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
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe.title,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            recipe.origin,
                            style: const TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.timer, size: 14, color: Colors.deepOrange),
                              const SizedBox(width: 4),
                              Text('${recipe.duration} mnt', style: const TextStyle(fontSize: 12)),
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