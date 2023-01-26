import 'package:flutter/material.dart';
import 'package:intern7/models/note_model.dart';
import 'package:intern7/providers/notes_provider.dart';
import 'package:provider/provider.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({Key? key}) : super(key: key);

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8EEE2),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xFF403B36),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Create Notes',
          style: TextStyle(color: Color(0xFF403B36)),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Color(0xFF403B36),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF8EEE2),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            TextFormField(
              style: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w900),
              decoration: const InputDecoration(hintText: "Title"),
              controller: titleController,
              minLines: 1,
              maxLines: 3,
              keyboardType: TextInputType.multiline,
            ),
            TextFormField(
              style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF595550)),
              decoration: const InputDecoration(hintText: "Description"),
              controller: descController,
              minLines: 1,
              maxLines: 20,
              keyboardType: TextInputType.multiline,
            ),
            Center(
              child: SizedBox(
                height: 70,
                width: 319,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextButton(
                      onPressed: () {
                        if (titleController.text.isEmpty ||
                            descController.text.isEmpty) {
                          Navigator.pop(context);
                        } else {
                          NoteModel note = NoteModel(
                            title: titleController.text,
                            description: descController.text,
                            id: DateTime.now().millisecond,
                          );

                          Provider.of<NotesProvider>(context, listen: false)
                              .addNote(note);
                          Navigator.pop(context);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFD9614C)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Save Note',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w900,
                            color: Color(0xFFFFFBFA),
                            fontSize: 20,
                            letterSpacing: 3),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
