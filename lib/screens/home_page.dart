import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void getBooks() async {
    http.Response responseData = await http
        .get((Uri.parse("http://192.168.1.24:5000/api/books/allbooks")));
    debugPrint(responseData.body);
  }

  List<String> responseData = [
    "Nation Nègre",
    "Une vie de boy"

  ];
  String text = "";

  @override
  void initState() {
    super.initState();
    getBooks();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modip Books"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: responseData.length,
        itemBuilder: (context, index) {
          return Card(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListTile(
                title: Text(
                  responseData[index],
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                subtitle: Text(
                  responseData[index]
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
                                                responseData[index] = text;
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Update"))
                                      ],
                                    ));
                          },
                          icon: const Icon(Icons.edit, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              responseData.removeAt(index);
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
