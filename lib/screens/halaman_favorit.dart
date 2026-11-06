import 'package:flutter/material.dart';
import '../models/resep_model.dart';
import 'detail_halaman.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Recipe> recipes;
  final Function(Recipe) onFavoriteToggle;

  const FavoriteScreen({
    super.key,
    required this.recipes,
    required this.onFavoriteToggle,
  });

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteRecipes = widget.recipes.where((r) => r.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resep Favorit Saya', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF5D4037),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: favoriteRecipes.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bookmark_border, size: 64, color: Colors.brown.shade300),
            const SizedBox(height: 12),
            Text(
              'Belum ada resep favorit tersimpan',
              style: TextStyle(color: Colors.brown.shade600, fontSize: 16),
            ),
          ],
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          final recipe = favoriteRecipes[index];
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  recipe.imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(recipe.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${recipe.origin} • ${recipe.duration} mnt'),
              trailing: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  setState(() {
                    widget.onFavoriteToggle(recipe);
                  });
                },
              ),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      recipe: recipe,
                      onFavoriteToggle: () {
                        widget.onFavoriteToggle(recipe);
                        setState(() {});
                      },
                    ),
                  ),
                );
                setState(() {});
              },
            ),
          );
        },
      ),
    );
  }
}