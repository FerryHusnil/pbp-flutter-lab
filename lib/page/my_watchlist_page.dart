import 'package:counter_7/component/drawer_app.dart';
import 'package:counter_7/page/detail_watchlist_page.dart';
import 'package:counter_7/util/fetch_my_watchlist.dart';
import 'package:flutter/material.dart';

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({super.key});

  @override
  State<MyWatchlistPage> createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  final _fetchMyWatchlist = fetchMyWatchlist();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Watch List"),
        ),
        drawer: const DrawerApp(),
        body: FutureBuilder(
            future: _fetchMyWatchlist,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada watch list :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => InkWell(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                      color:
                                          snapshot.data![index].fields.watched
                                              ? Colors.blue
                                              : Colors.red)),
                              child: Column(
                                children: [
                                  Text(
                                    "${snapshot.data![index].fields.title}",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  CheckboxListTile(
                                    title: const Text("Watched"),
                                    value: snapshot.data![index].fields.watched,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        snapshot.data![index].fields.watched =
                                            value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailWatchlistPage(
                                          myWatchlist: snapshot.data![index])));
                            },
                          ));
                }
              }
            }));
  }
}
