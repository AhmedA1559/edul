import 'dart:ui';

import 'package:edul/ui/screen/item_page.dart';
import 'package:edul/ui/widget/item_list_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await FirebaseAuth.instance.signInWithEmailAndPassword(email: 'ahmed+1@alcassab.net', password: 'Mojang1551');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OverlaySupport.global(child: MaterialApp(
      title: 'Edul',

      themeMode: ThemeMode.system,
      home: ItemPage(listId: '1e39f8c7-669e-4566-bca2-9618f65006ce',)));
  }
}
