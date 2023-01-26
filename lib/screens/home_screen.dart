import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intern7/providers/notes_provider.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'package:flutter/material.dart';
import 'create_note_screen.dart';
import 'edit_note_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NotesProvider>(context);

    return noteProvider.notes.isEmpty
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFFF8EEE2),
              leading: Image.asset(
                'assets/images/alignleft.png',
              ),
              title: const Text(
                'All Notes',
                style: TextStyle(color: Color(0xFF403B36)),
              ),
              centerTitle: true,
              elevation: 0,
            ),
            backgroundColor: const Color(0xFFF8EEE2),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 371,
                  width: 314,
                  // color: Colors.black,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/centerimage.png',
                        height: 221,
                        width: 268,
                      ),
                      const SizedBox(height: 20),
                      const NunitoText(
                        title: 'Create your first note',
                        size: 24,
                        number: FontWeight.w900,
                        textColor: Color(0xFF403B36),
                      ),
                      const SizedBox(height: 20),
                      const NunitoText(
                          title:
                              'Add a note about anything (your thoughts on climate change, or your history essay) and share it witht the world.',
                          size: 16,
                          number: FontWeight.w300,
                          textColor: Color(0xFF595550))
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 74,
                  width: 319,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CreateNoteScreen(),
                            ),
                          );
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
                          'Create A Note',
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w900,
                              color: Color(0xFFFFFBFA),
                              fontSize: 20,
                              letterSpacing: 3),
                        )),
                  ),
                ),
                const Spacer(),
              ],
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFFF8EEE2),
              leading: Image.asset(
                'assets/images/alignleft.png',
              ),
              title: const Text(
                'Recent Notes',
                style: TextStyle(
                  color: Color(0xFF403B36),
                ),
              ),
              centerTitle: true,
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateNoteScreen()),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Color(0xFF403B36),
                  ),
                ),
              ],
            ),
            backgroundColor: const Color(0xFFF8EEE2),
            body: MasonryGridView.builder(
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
              scrollDirection: Axis.vertical,
              mainAxisSpacing: 10,
              crossAxisSpacing: 0,
              itemCount: noteProvider.notes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditNoteScreen(
                                note: noteProvider.notes[index],
                              )),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 250, 250, 250),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(noteProvider.notes[index].title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromARGB(255, 37, 37, 37),
                              )),
                        ),
                        Text(noteProvider.notes[index].description)
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
