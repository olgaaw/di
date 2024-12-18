import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ud4_05_menunavegacion/models/popular_people/popular_people.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<PopularPeopleResponse> popularPeopleResponse;

  @override
  void initState() {
    super.initState();
    popularPeopleResponse = getPopularActors();
  }

  Future<PopularPeopleResponse> getPopularActors() async {
    const String apiKey = '6167e502c63acdce5db7c32294a559d3';
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/person/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return PopularPeopleResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      FutureBuilder<PopularPeopleResponse>(
        future: popularPeopleResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildPeopleList(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildPeopleList(PopularPeopleResponse popularPeopleResponse) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: popularPeopleResponse.results!.length,
      itemBuilder: (context, index) {
        final actor = popularPeopleResponse.results![index];

        String imageUrl = 'https://image.tmdb.org/t/p/w200${actor.profilePath}';

        return Container(
          margin:
              const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 375),
          padding: const EdgeInsets.all(10),
          width: 150,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 30, 30, 30),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text('${actor.name}')
            ],
          ),
        );
      },
    );
  }
}
