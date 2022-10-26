import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class AllBook extends StatefulWidget {
  const AllBook({Key? key}) : super(key: key);

  @override
  State<AllBook> createState() => _AllBookState();
}

class _AllBookState extends State<AllBook> {
  // late Map responseData;
  // late List bookData;
  // void getBooks() async {
  //   http.Response response = await http
  //       .get((Uri.parse("http://192.168.1.24:5000/api/books/allbooks")));
  //   debugPrint(response.body);
  //   responseData = json.decode(response.body);

  // setState(() {
  //   bookData = responseData["books"];
  // });

  // }

  final responseDatas = [
    {"bookTitle": "Nation Nègre", "bookAuteur": "Cheikh Anta"},
    {"bookTitle": "Une si longue lettre", "bookAuteur": "Mariama BA"},
    {"bookTitle": "Père Riche Père Pauvre", "bookAuteur": "Robert"}
  ];
  String text = "";

  @override
  void initState() {
    super.initState();
    //   getBooks();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modip Books"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: responseDatas.length,
        itemBuilder: (context, index) {
          final responseData = responseDatas[index];
          final bookTitle = responseData["bookTitle"];
          final bookAuteur = responseData["bookAuteur"];
          return Card(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListTile(
                title: Text(
                  '$bookTitle',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                subtitle: Text(
                  "$bookAuteur",
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
                trailing: SizedBox(
                  width: 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => SimpleDialog(
                                children: [
                                  TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        text = value;
                                      });
                                    },
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          //responseData[index] = text;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Update"))
                                ],
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              responseDatas.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
