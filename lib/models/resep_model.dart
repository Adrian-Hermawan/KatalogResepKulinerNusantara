class Recipe {
  final String id;
  final String title;
  final String imageUrl;
  final String origin;
  final int duration; // dalam menit
  final int portion;  // porsi
  final List<String> ingredients;
  final List<String> steps;
  bool isFavorite;

  Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.origin,
    required this.duration,
    required this.portion,
    required this.ingredients,
    required this.steps,
    this.isFavorite = false,
  });
}