import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todos/utils/constants.dart';
import 'package:todos/utils/dio_provider.dart';

import '../domain/todo.dart';

part 'todos_repository.g.dart';

class TodosRepository {
  const TodosRepository({required this.client});

  final Dio client;

  Future<int> count() async {
    final uri =
        Uri(
          scheme: 'https',
          host: 'jsonplaceholder.typicode.com',
          path: 'todos',
          queryParameters: {'_limit': '0'},
        ).toString();
    final response = await client.get(uri);

    return int.parse(response.headers['X-Total-Count']!.first);
  }

  Future<List<Todo>> todos({
    required int page,
    CancelToken? cancelToken,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    final uri =
        Uri(
          scheme: 'https',
          host: 'jsonplaceholder.typicode.com',
          path: 'todos',
          queryParameters: {
            '_page': page.toString(),
            '_per_page': Constants.pageSize.toString(),
          },
        ).toString();
    final response = await client.get(uri, cancelToken: cancelToken);

    return (response.data as List).map((json) => Todo.fromJson(json)).toList();
  }

  Future<List<Todo>> todosByTitle({
    required String title,
    required int page,
    CancelToken? cancelToken,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    final uri =
        Uri(
          scheme: 'https',
          host: 'jsonplaceholder.typicode.com',
          path: 'todos',
          queryParameters: {
            'q': title,
            '_page': page.toString(),
            '_per_page': Constants.pageSize.toString(),
          },
        ).toString();
    final response = await client.get(uri, cancelToken: cancelToken);

    return (response.data as List).map((json) => Todo.fromJson(json)).toList();
  }
}

@riverpod
TodosRepository todosRepository(Ref ref) =>
    TodosRepository(client: ref.watch(dioProvider));

@riverpod
Future<int> fetchTodosCount(Ref ref) {
  final repository = ref.watch(todosRepositoryProvider);

  return repository.count();
}

@riverpod
Future<List<Todo>> fetchTodos(
  Ref ref, {
  required int page,
  String title = "",
}) async {
  final repository = ref.watch(todosRepositoryProvider);
  final cancelToken = CancelToken();
  final link = ref.keepAlive();
  Timer? timer;

  ref.onDispose(() {
    cancelToken.cancel();
    timer?.cancel();
  });
  ref.onCancel(() {
    timer = Timer(const Duration(minutes: 5), () {
      link.close();
    });
  });
  ref.onResume(() {
    timer?.cancel();
  });

  if (title.trim().isNotEmpty) {
    return repository.todosByTitle(title: title, page: page);
  } else {
    return repository.todos(page: page);
  }
}
