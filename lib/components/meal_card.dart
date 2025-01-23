import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/providers/favorites_provider.dart';

class MealCard extends StatelessWidget {
  final Recipe recipe;

  const MealCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Container(
        width: w * .8,
        height: h * .4,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F4F8),
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              color: Color(0x33000000),
              offset: Offset(
                3,
                5,
              ),
              spreadRadius: 5,
            )
          ],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              recipe.images,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0x40000000),
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-1, 1),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontSize: w * .08,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: w * .35,
                    child: const Divider(
                      thickness: 4,
                      color: Color(0xFFeb4600),
                    ),
                  ),
                  SizedBox(
                    height: h * .05,
                  ),
                  // IconButton(
                  //   icon: Icon(
                  //     favoritesProvider.isFavorite(recipe)
                  //         ? Icons.favorite
                  //         : Icons.favorite_border,
                  //     color: favoritesProvider.isFavorite(recipe)
                  //         ? Colors.red
                  //         : Colors.grey,
                  //   ),
                  //   onPressed: () {
                  //     if (favoritesProvider.isFavorite(recipe)) {
                  //       favoritesProvider.removeFavorite(recipe);
                  //     } else {
                  //       favoritesProvider.addFavorite(recipe);
                  //     }
                  //   },
                  // ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              favoritesProvider.isFavorite(recipe)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: favoritesProvider.isFavorite(recipe)
                  ? Colors.red
                  : Colors.grey,
            ),
            onPressed: () {
              if (favoritesProvider.isFavorite(recipe)) {
                favoritesProvider.removeFavorite(recipe);
              } else {
                favoritesProvider.addFavorite(recipe);
              }
            },
          ),
        ]));
  }
}
