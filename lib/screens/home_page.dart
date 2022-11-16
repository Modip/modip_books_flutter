import 'package:flutter/material.dart';
import 'package:todo_list/models/books.dart';
import 'package:todo_list/screens/admin/addBook_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Books booksService = Books();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Modip Books"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddBookPage()));
            },
            icon: const Icon(Icons.add_card_outlined, color: Colors.white70),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List>(
          future: booksService.getAllBooks(),
          builder: (context, snapshot) {
            //print(snapshot.data);
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, i) {
                    return Card(
                      color: Theme.of(context).primaryColor,
                      child: ListTile(
                        title: Text(
                          snapshot.data![i]['title'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          snapshot.data![i]['autor'],
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: SizedBox(
                          width: 60,
                          child: Row(
                            children: [
                              Expanded(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit,
                                      color: Colors.white70),
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.orangeAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: Text("No data found"),
              );
            }
          },
        ),
      ),
    );
  }
}
