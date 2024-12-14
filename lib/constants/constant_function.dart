// import 'dart:convert';

// import 'package:http/http.dart' as http;

// class ConstantFunction {
//   static Future<List<Map<String, dynamic>>> getResponse() async {
//     String id = "b4569f96";
//     String key = "2859517f6941ed605f5a9e8829e80ca";
//     String api =
//         "https://api.edamam.com/search?q=chicken&app_id=${id}&app_key=${key}&from=0&to=3&calories=591-722&health=alcohol-free";

//     final response = await http.get(Uri.parse(api));
//     List<Map<String, dynamic>> recipes = [];
//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body);

//       if(data['hits']!=null){
        
//       }
//     }
//   }
// }
