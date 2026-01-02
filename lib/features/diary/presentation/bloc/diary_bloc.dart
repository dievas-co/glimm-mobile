import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:glimm/features/diary/domain/entities/diary_entry.dart';
import 'package:glimm/features/diary/domain/usecases/get_entries.dart';
import 'package:glimm/features/diary/domain/usecases/create_entry.dart';

part 'diary_bloc.freezed.dart';

@freezed
class DiaryEvent with _$DiaryEvent {
  const factory DiaryEvent.loadEntries() = _LoadEntries;
  const factory DiaryEvent.createEntry(String content) = _CreateEntry;
}

@freezed
class DiaryState with _$DiaryState {
  const factory DiaryState.initial() = _Initial;
  const factory DiaryState.loading() = _Loading;
  const factory DiaryState.loaded(List<DiaryEntry> entries) = _Loaded;
  const factory DiaryState.error(String message) = _Error;
}

@injectable
class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  final GetEntries _getEntries;
  final CreateEntry _createEntry;

  DiaryBloc(this._getEntries, this._createEntry) : super(const _Initial()) {
    on<_LoadEntries>((event, emit) async {
      emit(const _Loading());
      final result = await _getEntries();
      result.fold(
        (failure) =>
            emit(_Error(failure.message)), // Assuming Failure has message
        (entries) => emit(_Loaded(entries)),
      );
    });

    on<_CreateEntry>((event, emit) async {
      // We don't emit Loading here to avoid full screen flicker,
      // but in real app we might want to handle it better.
      final result = await _createEntry(event.content);
      result.fold(
        (failure) => emit(_Error(failure.message)),
        (_) => add(const _LoadEntries()),
      );
    });
  }
}
