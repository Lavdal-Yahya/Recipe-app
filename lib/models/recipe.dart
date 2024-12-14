class Recipe {
  final int id;
  final String name;
  final String images;
  final String? description;
  final List<String>? ingredients;
  final String? instructions;

  Recipe({
    required this.id,
    required this.name,
    required this.images,
    this.description,
    this.ingredients,
    this.instructions,
  });

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      id: json['id'] ?? 0,
      name: json['title'] as String? ?? "No Name",
      images: json['image'] as String? ?? "",
      description: json['summary'] as String? ?? "No description available.",
      ingredients: (json['extendedIngredients'] as List?)
          ?.map((e) => e['originalString'] as String? ?? "")
          .toList(),
      instructions:
          json['instructions'] as String? ?? "No instructions available.",
    );
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) => Recipe.fromJson(data)).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $images}';
  }
}
