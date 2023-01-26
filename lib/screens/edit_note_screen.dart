import 'package:flutter/material.dart';
import 'package:intern7/providers/notes_provider.dart';
import 'package:provider/provider.dart';
import '../models/note_model.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late final _titleController = TextEditingController(text: widget.note.title);
  late final _descController =
      TextEditingController(text: widget.note.description);

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
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
          'Edit Notes',
          style: TextStyle(color: Color(0xFF403B36)),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<NotesProvider>(context, listen: false)
                  .deleteNote(widget.note);
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.delete,
              color: Color(0xFF403B36),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF8EEE2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              TextFormField(
                style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w900),
                decoration: const InputDecoration(hintText: "Title"),
                controller: _titleController,
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
                controller: _descController,
                minLines: 1,
                maxLines: 20,
                keyboardType: TextInputType.multiline,
              ),
              const Spacer(),
              Center(
                child: SizedBox(
                  height: 70,
                  width: 319,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextButton(
                        onPressed: () {
                          if (_titleController.text.isEmpty ||
                              _descController.text.isEmpty) {
                            Navigator.pop(context);
                          } else {
                            final editedNote = NoteModel(
                              title: _titleController.text,
                              description: _descController.text,
                              id: widget.note.id,
                            );
                            Provider.of<NotesProvider>(context, listen: false)
                                .editNote(editedNote);
                            Navigator.of(context).pop();
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
                          'Edit Note',
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
      ),
    );
  }
}
