import 'package:flutter/material.dart';
import 'package:star_wars/models/people_list_response/people.dart';
import 'package:http/http.dart' as http;

class PersonDetailScreen extends StatefulWidget {
  final String personId;

  const PersonDetailScreen({super.key, required this.personId});

  @override
  State<PersonDetailScreen> createState() => _PersonDetailScreenState();
}

class _PersonDetailScreenState extends State<PersonDetailScreen> {
  late Future<People> personDetails;

  @override
  void initState() {
    super.initState();
    personDetails = getPersonDetails();
  }

  Future<People> getPersonDetails() async {
    final response = await http.get(Uri.parse('https://swapi.tech/api/people/${widget.personId}/'));

    if (response.statusCode == 200) {
      return People.fromJson(response.body);
    } else {
      throw Exception('Failed to load person details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "People",
          style: TextStyle(color: Color.fromARGB(255, 230, 197, 55), fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ),
      body: FutureBuilder<People>(
        future: personDetails,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final person = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    person.name!,
                    style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Gender: ${person.gender}',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'Birth Year: ${person.birthYear}',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'Height: ${person.height}',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'Mass: ${person.mass}',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}