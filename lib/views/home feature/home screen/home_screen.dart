import 'package:api_integration/core/helpers/custom_snackBars.dart';
import 'package:api_integration/model/notes_model.dart';
import 'package:api_integration/view%20Model/notepad%20controller/notepad_controller.dart';
import 'package:api_integration/view%20Model/notepad%20controller/notepad_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen(notepadProvider, (previous, next) {
      if (next is ErrorNotepadState) {
        CustomSnackBars.showSnackbar(
          context,
          title: next.message,
          errorColor: Colors.red,
        );
      }

      if (next is LoadedNotepadState) {
        CustomSnackBars.showSnackbar(context, title: "Data Added Successfully");
      }
    });

    return Scaffold(
      appBar: AppBar(leading: SizedBox(), title: Text("Home Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ref
                .read(notepadProvider.notifier)
                .insertNote(
                  NotesModel(
                    createdAt: DateTime.now().toString(),
                    describtion: "Hi There",
                    id: DateTime.now().microsecondsSinceEpoch,
                    title: "Shaban Bhatti",
                  ),
                );
          },
          child: Text("hit APi"),
        ),
      ),
    );
  }
}
