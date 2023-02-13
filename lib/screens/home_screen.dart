import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tobuy/db/database.dart';
import 'package:tobuy/widgets/todo_tile.dart';

import '../widgets/add_new_dialog.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/edit_item_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _inputContorller = TextEditingController();
  final ListDatabase _db = ListDatabase();

  void showAddNewItem() {
    showDialog(
      context: context,
      builder: (context) => AddNewDialog(
        controller: _inputContorller,
        onCancel: () {
          Navigator.of(context).pop();
          _inputContorller.clear();
        },
        onSave: () {
          if (_inputContorller.text.isNotEmpty) {
            setState(() {
              _db.shoppingList.add([_inputContorller.text, false]);
            });
            _inputContorller.clear();
            _db.updateDatabase();
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }

  void showEditItem(int index) {
    showDialog(
      context: context,
      builder: (context) => EditItemDialog(
        controller: _inputContorller,
        onCancel: () {
          Navigator.of(context).pop();
          _inputContorller.clear();
        },
        onSave: () {
          if (_inputContorller.text.isNotEmpty) {
            setState(() {
              _db.shoppingList[index][0] = _inputContorller.text;
            });
            _inputContorller.clear();
            _db.updateDatabase();
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _db.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor("ACD850"),
        onPressed: showAddNewItem,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.separated(
        itemCount: _db.shoppingList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Divider(),
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return TodoTile(
            name: _db.shoppingList[index][0],
            isComplated: _db.shoppingList[index][1],
            onChange: (value) {
              setState(() {
                _db.shoppingList[index][1] = !_db.shoppingList[index][1];
              });
              _db.updateDatabase();
            },
            onEdit: () {
              _inputContorller.text = _db.shoppingList[index][0];
              showEditItem(index);
              _db.updateDatabase();
            },
            onDelete: () {
              setState(() {
                _db.shoppingList.removeAt(index);
              });
              _db.updateDatabase();
            },
          );
        },
      ),
    );
  }
}
