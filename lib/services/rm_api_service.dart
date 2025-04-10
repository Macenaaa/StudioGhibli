import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:studio_ghibli/models/people.dart';

class RmApiService {

static const String baseUrl = 'https://ghibliapi.vercel.app';

Future<List<People >>fetchPeople() async {
 final response = await http.get(Uri.parse("$baseUrl/People/"));

if(response.statusCode == 200 ){ 
    final data = json.decode(response.body);
    final List results = data ["results"];
    return results.map((json)=> People.fromJson(json)). toList();
 } else {
  throw Exception("Falha ao carregar os personagens");
 }

}

}


