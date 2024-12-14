class IngredientRecipe {
  final int id;
  final String name;
  final String image;
  final int usedIngredientCount;

  IngredientRecipe({
    required this.id,
    required this.name,
    required this.image,
    required this.usedIngredientCount,
  });

  factory IngredientRecipe.fromJson(Map<String, dynamic> json) {
    return IngredientRecipe(
      id: json['id'] ?? 0,
      name: json['title'] ?? 'No Title',
      image: json['image'] ?? '',
      usedIngredientCount: json['usedIngredientCount'] ?? 0,
    );
  }

  static List<IngredientRecipe> recipesFromSnapshot(List<dynamic> snapshot) {
    return snapshot.map((data) => IngredientRecipe.fromJson(data)).toList();
  }
}
