import 'package:edul/model/item.dart';
import 'package:edul/ui/widget/item_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditBottomSheet extends ConsumerStatefulWidget {
  const EditBottomSheet({Key? key}) : super(key: key);

  @override
  _EditBottomSheetState createState() => _EditBottomSheetState();
}

class _EditBottomSheetState extends ConsumerState<EditBottomSheet> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    //Item curItem = ref.watch(itemProvider);
    //_controller.text = curItem.description;
    return
      SingleChildScrollView(
          child: Wrap(
            children: [Column(
              children: [
                Checkbox(value: true, onChanged: (bool? value) {  },shape: const CircleBorder(),
                  tristate: false,
                ),
                Divider(thickness: 2),
                Column(
                  children: [
                    Container(margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: TextField(
                        autofocus: true,
                        controller: _controller,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom
                    ),
                    ),
                  ],
                ),
              ],
            )],
          ),
        );
  }
}
