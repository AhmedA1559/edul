import 'package:edul/service/providers.dart';
import 'package:edul/ui/widget/item_list_widget.dart';
import 'package:edul/viewmodel/Item_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/edit_bottom_sheet.dart';

class ItemPage extends ConsumerWidget {
  final String listId;

  const ItemPage({Key? key, required this.listId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(databaseProvider)!;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text('Item List', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(
          context: context, builder: (BuildContext context) { return EditBottomSheet(); }
        );
      },
        elevation: 0,
        child: const Icon(
          Icons.add_rounded,
          size: 35,
        ),
      ),
      body: SafeArea(
        child: ProviderScope(
          overrides: [
            itemListViewModelProvider.overrideWithValue(ItemListViewModel(database: database, listId: listId))
          ],
          child: ItemListWidget()
        ),
      ),

    );
  }
}
