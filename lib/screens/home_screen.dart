// import 'package:flutter/material.dart';
// import 'package:recipe_app/components/category_card.dart';
// // import 'package:recipe_app/components/home_app_bar.dart';
// import 'package:recipe_app/components/meal_card.dart';
// // import 'package:recipe_app/components/tab_bar_widget.dart';
// import 'package:recipe_app/components/text_field_widget.dart';
// import 'package:recipe_app/constants/iamges_paths.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:recipe_app/models/recipe.dart';
// import 'package:recipe_app/models/recipes_api.dart';
// import 'package:recipe_app/screens/breakfast_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late List<Recipe> _recipes;
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     getRecipes();
//   }

//   Future<void> getRecipes() async {
//     _recipes = await RecipesApi.getRecipe();
//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final h = MediaQuery.of(context).size.height;
//     // final w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: const Color(0xFFFFFCF3),
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: h * 0.025),
//               const TextFieldWidget(),
//               SizedBox(height: h * 0.022),
//               const Row(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   SizedBox(
//                     height: 50,
//                     child: VerticalDivider(
//                       thickness: 4,
//                       color: Color(0xFFF8CA57),
//                     ),
//                   ),
//                   Text(
//                     'Get Ready To Dive \nIn A World Of Flavors',
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                       color: Color(0xFF242424),
//                       fontSize: 28,
//                       letterSpacing: 0.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: h * 0.022),
//               CarouselSlider(
//                 options: CarouselOptions(
//                   height: h * 0.08,
//                   enlargeCenterPage: false,
//                   autoPlay: true,
//                   autoPlayInterval: const Duration(seconds: 8),
//                   viewportFraction: .5,
//                 ),
//                 items: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const BreakfastScreen()));
//                     },
//                     child: CategoryCard(
//                       title: "Breakfast",
//                       image: IamgesPaths.meal1,
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const BreakfastScreen()));
//                     },
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFFFFFCF3),
//                         foregroundColor: const Color(0xFFFFFCF3),
//                         shadowColor: const Color(0x33000000)),
//                     child:
//                         CategoryCard(title: "Lunch", image: IamgesPaths.meal2),
//                   ),
//                   GestureDetector(
//                     child:
//                         CategoryCard(title: "Dinner", image: IamgesPaths.meal3),
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const BreakfastScreen()));
//                     },
                    
//                   ),
//                   GestureDetector(
//                     child:
//                         CategoryCard(title: "Snack", image: IamgesPaths.meal7),
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const BreakfastScreen()));
//                     },
//                   ),
//                 ].map((widget) {
//                   return Builder(
//                     builder: (BuildContext context) {
//                       return Container(
//                         width: MediaQuery.of(context).size.width,
//                         margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                         decoration: BoxDecoration(
//                           color: Colors.transparent,
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: widget,
//                         ),
//                       );
//                     },
//                   );
//                 }).toList(),
//               ),
//               SizedBox(height: h * .02),
//               Center(
//                   child: Text("Popular Today",
//                       style: TextStyle(
//                           fontSize: h * .03, fontWeight: FontWeight.bold))),
//               SizedBox(height: h * .02),
//               _isLoading
//                   ? const Center(
//                       child: CircularProgressIndicator(),
//                     )
//                   : CarouselSlider(
//                       options: CarouselOptions(
//                         height: h * 0.45,
//                         pageSnapping: true,
//                         viewportFraction: h * 0.01,
//                         enlargeCenterPage: false,
//                         scrollDirection: Axis.vertical,
//                       ),
//                       items: _recipes.map((recipe) {
//                         return MealCard(
//                           title: recipe.name,
//                           cooktime: recipe.totalTime,
//                           rating: recipe.rating.toString(),
//                           imageUrl: recipe.images,
//                         );
//                       }).toList(),
//                     ),
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }
