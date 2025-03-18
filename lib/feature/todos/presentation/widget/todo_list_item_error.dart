import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos/feature/todos/data/todos_repository.dart';

class TodoListItemError extends ConsumerWidget {
  const TodoListItemError({
    super.key,
    required this.query,
    required this.page,
    required this.indexInPage,
    required this.isLoading,
    required this.error,
  });

  final String query;
  final int page;
  final int indexInPage;
  final bool isLoading;
  final String error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (indexInPage == 0) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(overflow: TextOverflow.ellipsis, error)),
            ElevatedButton(
              onPressed:
                  isLoading
                      ? null
                      : () {
                        ref.invalidate(
                          fetchTodosProvider(page: page, title: query),
                        );

                        return ref.read(
                          fetchTodosProvider(page: page, title: query).future,
                        );
                      },
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
