import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todos_search_query_notifier.g.dart';

@riverpod
class TodosSearchQueryNotifier extends _$TodosSearchQueryNotifier {
  Timer? _debounceTimer;

  @override
  dynamic build() {
    ref.onDispose(() {
      _debounceTimer?.cancel();
    });

    return '';
  }

  void setQuery(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      state = query;
    });
  }
}
