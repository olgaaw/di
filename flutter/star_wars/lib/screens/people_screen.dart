import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:star_wars/models/people_list_response/people_list_response.dart';

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
                width: 100, height: 50, fit: BoxFit.fill),
            const SizedBox(
              width: 10,
            ),
            /*const Text(
              "People",
              style: TextStyle(
                  color: Color.fromARGB(255, 230, 197, 55),
                  fontSize: 35,
                  fontWeight: FontWeight.w700),
            ) */
          ],
        ),
      ),
      body: FutureBuilder<PeopleListResponse>(
        future: peopleResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildPeopleList(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<PeopleListResponse> getPeople() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/people'));

    if (response.statusCode == 200) {
      return PeopleListResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Widget _buildPeopleList(PeopleListResponse peopleListResponse) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: peopleListResponse.results!.length,
        itemBuilder: (context, index) {
          final people = peopleListResponse.results![index].url!;
          final peopleId = people.split('/')[5];
          return Column(
            children: [
              SizedBox(
                width: 250,
                child: Stack(
                  children: [
                    getImage(peopleId),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Color.fromARGB(0, 255, 255, 255),
                            Color.fromARGB(20, 0, 0, 0),
                            Color.fromARGB(50, 0, 0, 0),
                            Color.fromARGB(75, 0, 0, 0),
                            Color.fromARGB(100, 0, 0, 0)
                          ],
                        ),
                      ),
                      child: Text(
                        peopleListResponse.results![index].name!, 
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  Widget getImage(String id) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: NetworkImage(
              "https://starwars-visualguide.com/assets/img/characters/$id.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      height: 400,
      width: 250,
    );
  }
}
