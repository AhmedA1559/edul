import 'dart:convert';
import 'dart:ui';

import 'package:edul/viewmodel/Item_list_view_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../const.dart';
import '../../model/item.dart';
import '../notif/async_notif_helper.dart';

final itemListViewModelProvider = Provider<ItemListViewModel>((ref) => throw UnimplementedError());
class ItemListWidget extends ConsumerWidget {
  const ItemListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FirebaseAnimatedList(
      query: FirebaseDatabase.instance.ref(FirebasePath.listPath('1e39f8c7-669e-4566-bca2-9618f65006ce')),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 20),
      itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
        return SizeTransition(
          sizeFactor: animation,
          child: ProviderScope(
            overrides: [
              itemProvider.overrideWithValue(Item.fromMap({...(jsonDecode(jsonEncode(snapshot.value))), 'id':snapshot.key})),
            ],
            child: const ItemTile(),
          ),
        );
      },
    );
  }
}

final itemProvider = Provider<Item>((ref) => throw UnimplementedError());
class ItemTile extends ConsumerStatefulWidget {
  const ItemTile({Key? key}) : super(key: key);

  @override
  _ItemTileState createState() => _ItemTileState();
}

class _ItemTileState extends ConsumerState<ItemTile> {
  @override
  Widget build(BuildContext context) {
    Item curItem = ref.watch(itemProvider);
    return Card(
      key: ValueKey(curItem.id),
      margin: EdgeInsets.symmetric(horizontal: 50),
      //elevation: 8,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () => {},
        child: Row(
          children: [
            Checkbox(value: curItem.completed,
              onChanged: (bool? value) {
                showProgressNotif(
                    future: ref.read(itemListViewModelProvider).update(curItem.copyWith(completed: value))
                );
              },
              shape: const CircleBorder(),
              tristate: false,
            ),
            Text(curItem.description, style: curItem.completed ? TextStyle(decoration: TextDecoration.lineThrough) : null,),
          ],
        ),
      ),
    );
  }
}
