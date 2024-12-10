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
            const Text('Best Iranian Actors and Actresses',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: const Text('March 2020',
                  style: TextStyle(
                    color: Color.fromARGB(87, 0, 0, 0),
                    fontSize: 15,
                  )),
            ),
            SizedBox(
              height: 500,
              child: ListView(
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Row(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/emilia-clark.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: 400,
                            width: 200,
                          ),
                          const Text(
                            'Emilia',
                            style: TextStyle(fontSize: 30),
                          ),
                          const Text(
                            'Clark',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(88, 0, 0, 0)),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/emilia-clark.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: 400,
                            width: 200,
                          ),
                          const Text(
                            'Emilia',
                            style: TextStyle(fontSize: 30),
                          ),
                          const Text(
                            'Clark',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(88, 0, 0, 0)),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/emilia-clark.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: 400,
                            width: 200,
                          ),
                          const Text(
                            'Emilia',
                            style: TextStyle(fontSize: 30),
                          ),
                          const Text(
                            'Clark',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(88, 0, 0, 0)),
                          )
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
