import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../services/rm_api_service.dart';
import '../models/film.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Film>> _futureFilms;
  final GhibliApiService _apiService = GhibliApiService();

  @override
  void initState() {
    super.initState();
    _futureFilms = _apiService.fetchFilms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Studio Ghibli Filmes'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Film>>(
        future: _futureFilms,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final films = snapshot.data!;
            return ListView.builder(
              itemCount: films.length,
              itemBuilder: (context, index) {
                final film = films[index];
                return ListTile(
                  leading: Hero(
                    tag: film.id,
                    child: CachedNetworkImage(
                      imageUrl: film.image,
                      width: 50,
                      height: 70,
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.broken_image),
                    ),
                  ),
                  title: Text(film.title),
                  subtitle: Text('Diretor: ${film.director}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(film: film),
                      ),
                    );
                  },
                );
              },
            );
          }
          return const Center(child: Text('Nenhum dado disponível'));
        },
      ),
    );
  }
}
