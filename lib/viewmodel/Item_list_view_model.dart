import 'package:edul/model/item.dart';
import 'package:edul/service/database.dart';

class ItemListViewModel {
  final Database database;

  final String listId;

  ItemListViewModel({required this.database, required this.listId});

  Future<void> add(Item item) async {
    await database.createItem(item, listId);
  }

  Future<void> update(Item item) async {
    await database.updateItem(item, listId);
  }

  Stream getStream() {
    return database.itemStream(listId);
  }

  Future<void> delete(Item item) async {
    await database.deleteItem(item, listId);
  }
}