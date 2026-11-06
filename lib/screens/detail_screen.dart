import 'package:flutter/material.dart';
import '../models/resep_model.dart';

class DetailScreen extends StatefulWidget {
  final Recipe recipe;
  final VoidCallback onFavoriteToggle;

  const DetailScreen({
    super.key,
    required this.recipe,
    required this.onFavoriteToggle,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar dengan Gambar Header Interaktif
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            actions: [
              IconButton(
                icon: Icon(
                  widget.recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: widget.recipe.isFavorite ? Colors.red : Colors.white,
                ),
                onPressed: () {
                  widget.onFavoriteToggle();
                  setState(() {});
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.recipe.title,
                style: const TextStyle(
                  color: Colors.white,
                  shadows: [Shadow(blurRadius: 10, color: Colors.black)],
                ),
              ),
              background: Hero(
                tag: 'recipe_image_${widget.recipe.id}',
                child: Image.network(
                  widget.recipe.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Container(color: Colors.grey, child: const Icon(Icons.broken_image, size: 50)),
                ),
              ),
            ),
          ),

          // Konten Detail Resep
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Informasi Porsi & Durasi
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildInfoChip(Icons.timer, '${widget.recipe.duration} Menit'),
                        _buildInfoChip(Icons.restaurant, '${widget.recipe.portion} Porsi'),
                        _buildInfoChip(Icons.location_on, widget.recipe.origin),
                      ],
                    ),
                    const Divider(height: 32),

                    // Rincian Bahan-bahan
                    const Text('Bahan-bahan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    ...widget.recipe.ingredients.map((item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle_outline, color: Colors.deepOrange, size: 18),
                          const SizedBox(width: 8),
                          Expanded(child: Text(item, style: const TextStyle(fontSize: 14))),
                        ],
                      ),
                    )),
                    const Divider(height: 32),

                    // Langkah Memasak
                    const Text('Langkah Memasak', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    ...widget.recipe.steps.asMap().entries.map((entry) {
                      int idx = entry.key + 1;
                      String step = entry.value;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.deepOrange,
                              child: Text('$idx', style: const TextStyle(color: Colors.white, fontSize: 12)),
                            ),
                            const SizedBox(width: 12),
                            Expanded(child: Text(step, style: const TextStyle(fontSize: 14))),
                          ],
                        ),
                      );
                    }),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Chip(
      avatar: Icon(icon, size: 18, color: Colors.deepOrange),
      label: Text(label, style: const TextStyle(fontSize: 12)),
      backgroundColor: Colors.deepOrange.shade50,
      side: BorderSide.none,
    );
  }
}