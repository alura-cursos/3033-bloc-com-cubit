import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bilheteria_panucci/models/movie.dart';

class HomeService {
  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/alura-cursos/3033-bloc-com-cubit/main/lib/movies.json'));

    final json = jsonDecode(response.body);

    return List<Movie>.from(json['filmes'].map((elemento) {
      return Movie.fromJson(elemento);
    }));
  }

  Future<List<Movie>> fetchMoviesByGenre(String genre) async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/alura-cursos/3033-bloc-com-cubit/main/lib/movies.json'));

    final json = jsonDecode(response.body);

    final list = List<Movie>.from(json['filmes'].map((elemento) {
      return Movie.fromJson(elemento);
    }));

    return list.where((element) => element.genre == genre).toList();
  }
}
