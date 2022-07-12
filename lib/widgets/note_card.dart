import 'package:flutter/material.dart';
import 'package:seiornote/database/models/note.dart';
import 'package:seiornote/helper/color.dart';
import 'package:seiornote/helper/router.dart';
import 'package:seiornote/helper/size.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback onDeleteTap;

  const NoteCard({super.key, required this.note, required this.onDeleteTap});

  String formatDate(DateTime dateTime) {
    final data = [dateTime.day, dateTime.month, dateTime.year];

    return '${data[0]}/${data[1]}/${data[2]}';
  }

  Widget noteWithTitle(BuildContext context, Note note) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          note.title,
          style: Theme.of(context).textTheme.titleLarge,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          note.content,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
          maxLines: 10,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              formatDate(note.createdAt),
              style: Theme.of(context).textTheme.caption,
            )
          ],
        )
      ],
    );
  }

  Widget noteWithoutTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          note.content,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
          maxLines: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              formatDate(note.createdAt),
              style: Theme.of(context).textTheme.caption,
            )
          ],
        )
      ],
    );
  }

  Widget dialogWidget(BuildContext context, double curve) {
    return SafeArea(
      child: Transform.scale(
        alignment: Alignment.topCenter,
        filterQuality: FilterQuality.high,
        scale: curve,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Material(
              color: kPrimaryColor,
              child: SizedBox(
                height: kToolbarHeight,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_outlined),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: onDeleteTap,
                      icon: const Icon(Icons.delete_outline),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.favorite_border_outlined),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouterName.editNote, arguments: note);
      },
      onLongPress: () {
        showGeneralDialog(
          context: context,
          barrierColor: Colors.transparent,
          barrierDismissible: true,
          barrierLabel: '',
          pageBuilder: (context, animation, secondaryAnimation) => Container(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionBuilder: (context, animation, secondaryAnimation, child) {
            final curve = Curves.easeOutBack.transform(animation.value);

            return dialogWidget(context, curve);
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          top: kMaterialListPadding.top,
          left: kMaterialListPadding.top,
          right: kMaterialListPadding.top,
        ),
        padding: EdgeInsets.all(kMaterialListPadding.top),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            style: BorderStyle.solid,
            color: kPrimaryColor,
            width: 2.5,
          ),
          borderRadius: kCardBorderRadus,
        ),
        child: (note.title != '') ? noteWithTitle(context, note) : noteWithoutTitle(context),
      ),
    );
  }
}
