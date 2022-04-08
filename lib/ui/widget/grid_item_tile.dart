import 'package:edul/model/group.dart';
import 'package:flutter/material.dart';

class GridItemTile extends StatelessWidget {
  final Group group;

  const GridItemTile({required this.group, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(group.name),);
  }
}
