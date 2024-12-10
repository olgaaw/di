import 'package:flutter/material.dart';

class ListaHorizontal extends StatelessWidget {
  const ListaHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.only(top: 50, left: 20),
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Best Iranian Actors and Actress',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
            const Text('March 2020',
                style: TextStyle(
                  color: Color.fromARGB(87, 0, 0, 0),
                  fontSize: 20,
                )),
            SizedBox(
              height: 500, // constrain height
              child: ListView(
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Row(children: [
                      Column(
                        children: [
                          Image.asset('assets/img/emilia-clark.jpg'),
                        ],
                      )
                    ])
                  ]),
            )
          ],
        ),
      ),
    ));
  }
}
