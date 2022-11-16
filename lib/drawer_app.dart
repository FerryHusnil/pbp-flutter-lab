import 'package:flutter/material.dart';
import "package:counter_7/main.dart";
import 'package:counter_7/add_budget_page.dart';
import "package:counter_7/data_budget_page.dart";

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
              Navigator.push(
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const DataBudgetPage(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
