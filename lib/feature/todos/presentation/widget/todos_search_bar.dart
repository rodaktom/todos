import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos/feature/todos/domain/todos_search_query_notifier.dart';

class TodosSearchBar extends ConsumerStatefulWidget {
  const TodosSearchBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodosSearchBarState();
}

class _TodosSearchBarState extends ConsumerState<TodosSearchBar> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: const BorderRadius.all(Radius.circular(48.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              spacing: 12.0,
              children: [
                Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.surfaceContainer,
                ),
                Expanded(
                  child: Center(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        hintText: "Search todos",
                      ),
                      onEditingComplete: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      onChanged: (value) {
                        ref
                            .read(todosSearchQueryNotifierProvider.notifier)
                            .setQuery(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
