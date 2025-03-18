import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos/feature/todos/data/todos_repository.dart';
import 'package:todos/feature/todos/domain/todos_search_query_notifier.dart';
import 'package:todos/feature/todos/presentation/widget/todo_list_item.dart';
import 'package:todos/feature/todos/presentation/widget/todo_list_item_error.dart';
import 'package:todos/feature/todos/presentation/widget/todo_list_item_shimmer.dart';
import 'package:todos/feature/todos/presentation/widget/todos_search_bar.dart';

import '../../../../utils/constants.dart';

class TodosScreen extends ConsumerWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosCount = ref.watch(fetchTodosCountProvider);
    final query = ref.watch(todosSearchQueryNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Todos")),
      body: Column(
        children: [
          const TodosSearchBar(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(fetchTodosProvider);

                try {
                  await ref.read(
                    fetchTodosProvider(page: 1, title: query).future,
                  );
                } catch (_) {}
              },
              child: todosCount.when(
                error: (error, stackTrace) {
                  return Center(
                    child: Column(
                      children: [
                        Text("Failed to fetch todos!"),
                        ElevatedButton(
                          child: Text("Retry"),
                          onPressed: () {
                            ref.invalidate(fetchTodosCountProvider);
                          },
                        ),
                      ],
                    ),
                  );
                },
                loading: () {
                  return Center(child: RefreshProgressIndicator());
                },
                data: (itemCount) {
                  return ListView.builder(
                    key: ValueKey(query),
                    reverse: true,
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      final page = index ~/ Constants.pageSize + 1;
                      final indexInPage = index % Constants.pageSize;
                      final todos = ref.watch(
                        fetchTodosProvider(page: page, title: query),
                      );

                      return todos.when(
                        loading: () => const TodoListItemShimmer(),
                        error:
                            (error, _) => TodoListItemError(
                              query: query,
                              page: page,
                              indexInPage: indexInPage,
                              isLoading: todos.isLoading,
                              error: error.toString(),
                            ),
                        data: (data) {
                          if (indexInPage >= data.length) {
                            return null;
                          } else {
                            final todo = data[indexInPage];

                            return TodoListItem(todo: todo);
                          }
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
