import 'package:seiornote/modules/favorite/screens/favorite_screen.dart';
import 'package:seiornote/modules/home/screens/home_screen.dart';
import 'package:seiornote/modules/note/screens/create_note_screen.dart';
import 'package:seiornote/modules/note/screens/edit_note_screen.dart';
import 'package:seiornote/modules/settings/screens/setting_screen.dart';

class RouterUtils {
  static final routes = {
    RouterName.home: (contex) => const HomeScreen(),
    RouterName.favorite: (contex) => const FavoriteScreen(),
    RouterName.createNote: (contex) => const CreateNoteScreen(),
    RouterName.editNote: (contex) => const EditNoteScreen(),
    RouterName.settingNote: (contex) => const SettingScreen(),
  };
}

class RouterName {
  static const String initialRoute = '/';

  static const String home = '/';
  static const String favorite = '/favorite';
  static const String createNote = '/create_note';
  static const String editNote = '/edit_note';
  static const String settingNote = '/setting';
}
