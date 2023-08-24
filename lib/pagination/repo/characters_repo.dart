import 'dart:convert';
import 'package:http/http.dart';

// class CharacterRepository {
//   String userUrl = 'https://rickandmortyapi.com/api/character?page=1';
//
//   Future<List<Character>> getCharakters() async {
//     Response response = await get(Uri.parse(userUrl));
//
//     if (response.statusCode == 200) {
//       final List result = jsonDecode(response.body)['results'];
//       return result.map((e) => Character.fromJson(e)).toList();
//     } else {
//       throw Exception(response.reasonPhrase);
//     }
//   }
// }

class CharacterRepo {
  fetchPosts(int page) async {
    final url = Uri.parse("https://rickandmortyapi.com/api/character?page=$page");
    var response = await get(url);
    if (response.statusCode == 200){
      var json = jsonDecode(response.body)['results'] as List;
      return json;
    }
  }
}
