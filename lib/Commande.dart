import 'package:flutter/material.dart';
import './DataBaseHelper.dart';

class CommandePage extends StatefulWidget {
  @override
  _CommandePageState createState() => _CommandePageState();
}

class _CommandePageState extends State<CommandePage> {
  List<Map<String, dynamic>>? _commands;

  @override
  void initState() {
    super.initState();
    _loadCommands();
  }

  Future<void> _loadCommands() async {
    final dbHelper = DatabaseHelper();
    final commands = await dbHelper.getAllCommands();
    setState(() {
      _commands = commands;
    });
  }

  Future<void> _deleteCommands() async {
    final dbHelper = DatabaseHelper();
    await dbHelper.deleteAllCommande();
    setState(() {
      _commands = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_commands == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Commande'),
        actions: [
          IconButton(
            icon: const Icon(Icons.remove_shopping_cart_outlined),
            onPressed: _deleteCommands,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _commands!.length,
        itemBuilder: (BuildContext context, int index) {
          final command = _commands![index];
          return Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(command['description']),
                  subtitle: Text('Total: ${command['total']}'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
