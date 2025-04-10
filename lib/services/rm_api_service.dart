import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/film.dart';

class GhibliApiService {
  final String _baseUrl = 'https://ghibliapi.vercel.app/films';

  Future<List<Film>> fetchFilms() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Film.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar os filmes');
    }
  }
}
