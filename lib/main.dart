import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:seiornote/database/models/note.dart';
import 'package:seiornote/database/repository/impl/note_repository_impl.dart';
import 'package:seiornote/intial_app.dart';
import 'package:seiornote/modules/favorite/providers/favorite_provider.dart';
import 'package:seiornote/modules/home/providers/home_provider.dart';
import 'package:seiornote/modules/note/providers/note_provider.dart';
import 'package:seiornote/modules/settings/providers/setting_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  // initialize hive
  await Hive.initFlutter();

  // register hive adapter
  Hive.registerAdapter(NoteAdapter());

  // open box
  await Hive.openBox<Note>(NoteRepositoryImpl.boxName);

  runApp(EasyLocalization(
    path: 'assets/translations',
    supportedLocales: const [
      Locale("id"),
      Locale("en"),
    ],
    saveLocale: true,
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => NoteProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => SettingProvider()),
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const InitialApp();
  }
}
