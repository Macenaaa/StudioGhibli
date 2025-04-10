import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/film.dart';

class DetailScreen extends StatelessWidget {
  final Film film;

  const DetailScreen({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(film.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: film.id,
              child: CachedNetworkImage(
                imageUrl: film.image,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.broken_image, size: 100),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              film.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Diretor: ${film.director}'),
            Text('Lançamento: ${film.releaseDate}'),
            const SizedBox(height: 16),
            Text(film.description),
          ],
        ),
      ),
    );
  }
}
