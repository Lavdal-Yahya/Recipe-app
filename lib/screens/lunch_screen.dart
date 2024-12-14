import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/components/meal_card.dart';
import 'package:recipe_app/components/page_heading.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/models/recipes_api.dart';
import 'package:recipe_app/screens/recipe_detail_screen.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({super.key});

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    try {
      _recipes = await RecipesApi.getRecipe("lunch");
    } catch (e) {
      _recipes = [];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching recipes: $e")),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        width: w,
        height: h,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
            w * .05,
            h * .04,
            w * .05,
            h * .04,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageHeading(),
                  SizedBox(height: h * .01),
                  _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : _recipes.isEmpty
                          ? const Center(
                              child: Text("No recipes found."),
                            )
                          : CarouselSlider(
                              options: CarouselOptions(
                                height: h * 0.842,
                                pageSnapping: true,
                                viewportFraction: .5,
                                enlargeCenterPage: false,
                                enableInfiniteScroll: false,
                                scrollDirection: Axis.vertical,
                              ),
                              items: _recipes.map((recipe) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            RecipeDetailScreen(
                                                recipeId: recipe.id),
                                      ),
                                    );
                                  },
                                  child: MealCard(
                                    recipe: recipe,
                                  ),
                                );
                              }).toList(),
                            ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
