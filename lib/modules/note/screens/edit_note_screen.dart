import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:seiornote/database/models/note.dart';
import 'package:seiornote/helper/color.dart';
import 'package:seiornote/helper/languages.dart';
import 'package:seiornote/helper/router.dart';
import 'package:seiornote/helper/size.dart';
import 'package:seiornote/modules/home/providers/home_provider.dart';
import 'package:seiornote/modules/note/providers/note_provider.dart';
import 'package:seiornote/modules/note/screens/popup_widget.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final FocusNode _titleNode = FocusNode();
  final FocusNode _contentNode = FocusNode();

  late TextEditingController _titleController;
  late TextEditingController _contentController;

  // TODO: add tag later
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  // TODO : fix multiple cursor
  Widget titleTextField() {
    return TextField(
      focusNode: _titleNode,
      maxLines: 1,
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: LanguageKey.title.tr(),
      ),
      style: Theme.of(context).textTheme.titleLarge,
      autocorrect: true,
      autofocus: true,
      inputFormatters: [
        LengthLimitingTextInputFormatter(25),
      ],
      controller: _titleController,
    );
  }

  Widget contentTextField() {
    return Expanded(
      child: TextField(
        focusNode: _contentNode,
        maxLines: 9999,
        cursorColor: kPrimaryColor,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: LanguageKey.content.tr(),
        ),
        autocorrect: true,
        inputFormatters: [
          LengthLimitingTextInputFormatter(99999),
        ],
        controller: _contentController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Note note = ModalRoute.of(context)!.settings.arguments as Note;

    _titleController.text = note.title;
    _contentController.text = note.content;
    context.read<NoteProvider>().isFavorite = note.isFavorite;

    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageKey.editNote.tr()),
        leading: IconButton(
          onPressed: () {
            final newNote = note.copyWith(
              isFavorite: context.read<NoteProvider>().isFavorite,
              title: _titleController.text,
              content: _contentController.text,
              updatedAt: DateTime.now(),
            );

            context.read<NoteProvider>().editNote(newNote);
            context.read<HomeProvider>().reloadNotes();

            context.read<NoteProvider>().isFavorite = false;

            Navigator.popUntil(context, ModalRoute.withName(RouterName.home));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          PopUpWidget(
            note: note,
          )
        ],
      ),
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          children: [
            titleTextField(),
            contentTextField(),
          ],
        ),
      ),
    );
  }
}
