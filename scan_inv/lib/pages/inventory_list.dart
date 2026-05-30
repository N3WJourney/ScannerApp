import 'package:flutter/material.dart';

class MyInventoryListPage extends StatefulWidget {
  const MyInventoryListPage({Key? key}) : super(key: key);

  @override
  State<MyInventoryListPage> createState() => _MyInventoryListPageState();
}

class _MyInventoryListPageState extends State<MyInventoryListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.indigo,
        backgroundColor: const Color.fromARGB(193, 70, 90, 206),
        title: const Text('Inventory'),
      ),
      body: ListView(
        children: [
          SearchBar(
            hintText: 'Search inventory code...',
            leading: const Icon(Icons.search),
            onChanged: (value) {
              // Handle search query changes
            },
            onSubmitted: (value) {
              // Handle search submission
            },
          ),
          //check/uncheck filter
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DataTable(
              headingTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.indigo),
              border: TableBorder.symmetric(
                outside: BorderSide(color: Colors.grey),
              ),
              columns: const [
                DataColumn(label: Text('Checked')),
                DataColumn(label: Text('Code')),
                DataColumn(label: Text('Description')),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(Checkbox(
                      value: false,
                      onChanged: (value) {
                        //setState(() {});
                      },
                    )),
                    DataCell(const Text('C4763759')),
                    DataCell(const Text('Laptop')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Checkbox(
                      value: false,
                      onChanged: (value) {
                        //setState(() {});
                      },
                    )),
                    DataCell(const Text('C2648593')),
                    DataCell(const Text('Docking Station')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
