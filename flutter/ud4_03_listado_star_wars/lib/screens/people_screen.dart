import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:star_wars/models/people_list_response/people_list_response.dart';
import 'package:star_wars/screens/people_detail_screen.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  late Future<PeopleListResponse> peopleResponse;

  @override
  void initState() {
    super.initState();
    peopleResponse = getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Image.asset("assets/images/Star_Wars_Logo.png",
                width: 100, height: 60, fit: BoxFit.fill),
                SizedBox(width: 15,),
                const Text(
              "People",
              style: TextStyle(
                  color: Color.fromARGB(255, 230, 197, 55),
                  fontSize: 35,
                  fontWeight: FontWeight.w700),
            ) 
          ],
        ),
      ),
      body: 
      FutureBuilder<PeopleListResponse>(
        future: peopleResponse,
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

  Future<PeopleListResponse> getPeople() async {
    final response = await http.get(Uri.parse('https://swapi.tech/api/people'));

    if (response.statusCode == 200) {
      return PeopleListResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Widget _buildPeopleList(PeopleListResponse peopleListResponse) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: peopleListResponse.results!.length,
      itemBuilder: (context, index) {
        final people = peopleListResponse.results![index].url!;
        final peopleId = people.split('/')[5];
        return Container(
          margin:
              const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 100),
          padding: const EdgeInsets.all(20),
          width: 300,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 30, 30, 30),
            borderRadius: BorderRadius.circular(35),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Image.network(
                  "https://starwars-visualguide.com/assets/img/characters/$peopleId.jpg",
                  height: 375,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 25),
              Text(
                //peopleListResponse.results![index].name!,
                "personaje",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Chip(
                    label: Text(
                      "genero",
                      //peopleListResponse.results![index].gender!,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.grey[900],
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Chip(
                    label: Text(
                      //peopleListResponse.results![index].birthYear!,
                      "año",
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.grey[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                 onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonDetailScreen(personId: peopleId),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(275, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Ver más",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
