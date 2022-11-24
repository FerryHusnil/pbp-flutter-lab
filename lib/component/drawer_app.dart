import 'package:counter_7/page/my_home_page.dart';
import 'package:counter_7/page/my_watchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/page/add_budget_page.dart';
import 'package:counter_7/page/data_budget_page.dart';

class DrawerApp extends StatefulWidget {
  const DrawerApp({super.key});

  @override
  State<DrawerApp> createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text("counter_7"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const MyHomePage(title: "Program Counter"),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Tambah Budget"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const AddBudgetPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Budget List"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const DataBudgetPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Watch List"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const MyWatchlistPage(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
