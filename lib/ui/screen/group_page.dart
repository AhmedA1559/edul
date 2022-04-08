import 'package:edul/model/group.dart';
import 'package:edul/service/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/providers.dart';
import '../widget/grid_item_tile.dart';

var groupStreamProvider = StreamProvider<List<Group>>((ref) {
  final viewModel = ref.watch(groupViewModelProvider);
  return viewModel.getStream();
});

class GroupPage extends ConsumerWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupListData = ref.watch(groupStreamProvider);
    return groupListData.when(
        data: (list) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: list.length,
            itemBuilder: (ctx, index) {
              return GridItemTile(group: list[index]);
            },
          );
        },
        error: (err, stack) => throw err,
        loading: () => const CircularProgressIndicator());
  }
}
