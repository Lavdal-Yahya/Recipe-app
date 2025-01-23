class CreatedRecipe {
  final String name;
  final String ingredients;
  final String instructions;
  final String image;

  CreatedRecipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.image,
  });

  // Convert CreatedRecipe to a Map for storage, if needed
  Map<String, String> toMap() {
    return {
      'name': name,
      'ingredients': ingredients,
      'instructions': instructions,
    };
  }

  // Create a CreatedRecipe from a Map
  factory CreatedRecipe.fromMap(Map<String, String> map) {
    return CreatedRecipe(
      name: map['name'] ?? '',
      ingredients: map['ingredients'] ?? '',
      instructions: map['instructions'] ?? '',
      image: map['image'] ?? '',
    );
  }
}
