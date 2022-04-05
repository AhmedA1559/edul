import 'package:edul/service/providers.dart';
import 'package:edul/viewmodel/Item_list_view_model.dart';
import 'package:edul/viewmodel/group_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewModelProvider = Provider.family<ItemListViewModel, String>((ref, listId) {
  final database = ref.watch(databaseProvider)!;
  return ItemListViewModel(database: database, listId: listId);
});

final groupViewModelProvider = Provider((ref) {
  final database = ref.watch(databaseProvider)!;
  return GroupListViewModel(database: database);
});