import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glimm/core/di/injection.dart';
import 'package:glimm/features/diary/presentation/bloc/diary_bloc.dart';
import 'package:glimm/features/diary/presentation/pages/entry_editor_page.dart';
import 'package:glimm/features/diary/domain/entities/diary_entry.dart';
import 'package:intl/intl.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<DiaryBloc>()..add(const DiaryEvent.loadEntries()),
      child: const _TimelineView(),
    );
  }
}

class _TimelineView extends StatelessWidget {
  const _TimelineView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<DiaryBloc, DiaryState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
            error: (message) => Center(
              child: Text(message, style: const TextStyle(color: Colors.red)),
            ),
            loaded: (entries) => CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  backgroundColor: Colors.black,
                  title: const Text(
                    'GLIMM',
                    style: TextStyle(color: Colors.white, letterSpacing: 4),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.white),
                      onPressed: () {
                        // TODO: Navigate to settings
                      },
                    ),
                  ],
                ),
                if (entries.isEmpty)
                  const SliverFillRemaining(
                    child: Center(
                      child: Text(
                        'No entries yet.\nCapture your moment.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white54),
                      ),
                    ),
                  )
                else
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final entry = entries[index];
                      return _DiaryEntryItem(entry: entry);
                    }, childCount: entries.length),
                  ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: Colors.black),
        onPressed: () {
          final diaryBloc = context.read<DiaryBloc>();
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: diaryBloc,
                    child: const EntryEditorPage(),
                  ),
                ),
              )
              .then((_) {
                // Refresh list when returning from editor
                diaryBloc.add(const DiaryEvent.loadEntries());
              });
        },
      ),
    );
  }
}

class _DiaryEntryItem extends StatelessWidget {
  final DiaryEntry entry;

  const _DiaryEntryItem({required this.entry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time Column
          SizedBox(
            width: 50,
            child: Column(
              children: [
                Text(
                  DateFormat('dd').format(entry.entryDate),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat('MMM').format(entry.entryDate).toUpperCase(),
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
                // Time is usually in entryDate for Isar or we might have separate field?
                // Domain entity has entryDate (DateTime).
                // Let's use that.
                const SizedBox(height: 8),
                Text(
                  DateFormat('HH:mm').format(entry.entryDate),
                  style: const TextStyle(color: Colors.white30, fontSize: 10),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Content Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.content,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
