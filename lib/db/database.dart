import 'package:hive_flutter/hive_flutter.dart';

class ListDatabase {
  final box = Hive.box("myBox");
  List shoppingList = [];

  void initialData() {
    shoppingList = [
      ['Buy a Book', false],
      ['Buy a camera', false],
    ];
  }

  // load data from local database
  void loadData() {
    if (box.get('SHOPPINGLIST') == null) {
      initialData();
    } else {
      shoppingList = box.get('SHOPPINGLIST');
    }
  }

  // updata local database
  void updateDatabase() {
    box.put('SHOPPINGLIST', shoppingList);
  }
}
