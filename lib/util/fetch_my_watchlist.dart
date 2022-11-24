import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/my_watchlist.dart';

Future<List<MyWatchlist>> fetchMyWatchlist() async {
  var url = Uri.parse(
      "https://ferryhusnil-pbp-assignment.herokuapp.com/mywatchlist/json");
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json"
    },
  );
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<MyWatchlist> myWatchlist = [];
  for (var d in data) {
    if (d != null) {
      myWatchlist.add(MyWatchlist.fromJson(d));
    }
  }

  return myWatchlist;
}
