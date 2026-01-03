import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glimm/features/diary/presentation/bloc/diary_bloc.dart';

class EntryEditorPage extends StatefulWidget {
  const EntryEditorPage({super.key});

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const EntryEditorPage());
  }

  @override
  State<EntryEditorPage> createState() => _EntryEditorPageState();
}

class _EntryEditorPageState extends State<EntryEditorPage> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Auto-focus the text field when the page opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _saveEntry() {
    final content = _controller.text.trim();
    if (content.isNotEmpty) {
      context.read<DiaryBloc>().add(DiaryEvent.createEntry(content));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
            onPressed: _saveEntry,
            child: const Text(
              'SAVE',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  height: 1.5,
                ),
                cursorColor: Colors.white,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'What is on your mind?',
                  hintStyle: TextStyle(color: Colors.white24),
                  border: InputBorder.none,
                ),
              ),
            ),
            // TODO: Add image attachment toolbar here
          ],
        ),
      ),
    );
  }
}
