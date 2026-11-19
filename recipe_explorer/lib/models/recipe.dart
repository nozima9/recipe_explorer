class Recipe {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String category;
  final List<String> tags;
  final double rating;
  final int reviewCount;

  const Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.category,
    required this.tags,
    required this.rating,
    required this.reviewCount,
  });

  int get totalTimeMinutes => prepTimeMinutes + cookTimeMinutes;

  String get formattedTime {
    final hours = totalTimeMinutes ~/ 60;
    final minutes = totalTimeMinutes % 60;
    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }
    return '${minutes}m';
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      ingredients: List<String>.from(json['ingredients'] as List),
      instructions: List<String>.from(json['instructions'] as List),
      prepTimeMinutes: json['prepTimeMinutes'] as int,
      cookTimeMinutes: json['cookTimeMinutes'] as int,
      servings: json['servings'] as int,
      category: json['category'] as String,
      tags: List<String>.from(json['tags'] as List),
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['reviewCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'ingredients': ingredients,
      'instructions': instructions,
      'prepTimeMinutes': prepTimeMinutes,
      'cookTimeMinutes': cookTimeMinutes,
      'servings': servings,
      'category': category,
      'tags': tags,
      'rating': rating,
      'reviewCount': reviewCount,
    };
  }
}