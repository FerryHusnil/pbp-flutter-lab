import 'package:flutter/material.dart';
import 'package:counter_7/component/drawer_app.dart';
import 'package:provider/provider.dart';
import 'package:counter_7/model/budget.dart';

class DataBudgetPage extends StatefulWidget {
  const DataBudgetPage({super.key});

  @override
  State<DataBudgetPage> createState() => _DataBudgetPageState();
}

class _DataBudgetPageState extends State<DataBudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Budget List"),
        ),
        drawer: const DrawerApp(),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<BudgetModel>(builder: (context, value, child) {
              return ListView.builder(
                itemCount: value.budgets.length,
                itemBuilder: ((context, index) {
                  var item = value.budgets[index];

                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title,
                              style: const TextStyle(fontSize: 28)),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(item.nominal.toString()),
                              Text(item.type),
                              Text(item.date)
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              );
            })));
  }
}
