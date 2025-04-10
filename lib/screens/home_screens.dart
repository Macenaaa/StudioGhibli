import 'package:flutter/material.dart';
import 'package:studio_ghibli/models/people.dart';
import 'package:studio_ghibli/services/rm_api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late Future<List<People>> _futurePeoples;
  final RmApiService _apiService = RmApiService();

  @override
  void initState() {
    super.initState();
    _futurePeoples = _apiService.fetchPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Studio Ghibli'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<People>>(
        future: _futurePeoples,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final peoples = snapshot.data!;
            return ListView.builder(
              itemCount: peoples.length,
              itemBuilder: (context, index) {
                final people = peoples[index];
                return Placeholder();
              },
            );
          }
          return const Center(child: Text('Nenhum dado disponível'));
        },
      ),
    );
  }
}
