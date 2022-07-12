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

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageKey.createNote.tr()),
        leading: IconButton(
          onPressed: () {
            Note note = Note(
              title: _titleController.text,
              content: _contentController.text,
              isFavorite: context.read<NoteProvider>().isFavorite,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            );

            // check if content or tile is empty
            if (note.content != '') {
              context.read<NoteProvider>().createNote(note);
              context.read<HomeProvider>().reloadNotes();

              context.read<NoteProvider>().isFavorite = false;
            }

            Navigator.popUntil(context, ModalRoute.withName(RouterName.home));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          PopUpWidget(
            note: Note(
              title: _titleController.text,
              content: _contentController.text,
              isFavorite: false,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
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
