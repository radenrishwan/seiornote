import 'package:flutter/material.dart';
import 'package:seiornote/helper/router.dart';
import 'package:seiornote/modules/home/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:seiornote/modules/home/screens/home_drawer.dart';
import 'package:seiornote/modules/note/providers/note_provider.dart';
import 'package:seiornote/widgets/empty_widget.dart';
import 'package:seiornote/widgets/loading_widget.dart';
import 'package:seiornote/widgets/note_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget bodyWidget(BuildContext context) {
    return FutureBuilder<void>(
      future: context.read<HomeProvider>().findAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingWidget();
        }

        return Consumer<HomeProvider>(
          builder: (context, value, child) {
            if (value.notes.isEmpty) {
              return const EmptyWidget();
            }

            return ListView.builder(
              itemCount: value.notes.length,
              itemBuilder: (context, index) {
                return NoteCard(
                  note: value.notes[index],
                  onDeleteTap: () {
                    context.read<NoteProvider>().deleteNote(value.notes[index].id ?? '');
                    context.read<HomeProvider>().reloadNotes();
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  Widget floatingButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, RouterName.createNote);
      },
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Seior Notes.'),
      ),
      drawer: const HomeDrawer(),
      body: bodyWidget(context),
      floatingActionButton: floatingButton(context),
    );
  }
}
