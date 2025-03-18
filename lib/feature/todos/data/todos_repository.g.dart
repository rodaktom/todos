// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todosRepositoryHash() => r'9991c9df9efe33d1ea55afd5afc9a16bbdfa4473';

/// See also [todosRepository].
@ProviderFor(todosRepository)
final todosRepositoryProvider = AutoDisposeProvider<TodosRepository>.internal(
  todosRepository,
  name: r'todosRepositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$todosRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TodosRepositoryRef = AutoDisposeProviderRef<TodosRepository>;
String _$fetchTodosCountHash() => r'f362cc58b32d1122f0bfd36acda512a7869096ec';

/// See also [fetchTodosCount].
@ProviderFor(fetchTodosCount)
final fetchTodosCountProvider = AutoDisposeFutureProvider<int>.internal(
  fetchTodosCount,
  name: r'fetchTodosCountProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$fetchTodosCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchTodosCountRef = AutoDisposeFutureProviderRef<int>;
String _$fetchTodosHash() => r'0fd998ee9a1528a3ac9a07ccafd49bee3d09e428';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchTodos].
@ProviderFor(fetchTodos)
const fetchTodosProvider = FetchTodosFamily();

/// See also [fetchTodos].
class FetchTodosFamily extends Family<AsyncValue<List<Todo>>> {
  /// See also [fetchTodos].
  const FetchTodosFamily();

  /// See also [fetchTodos].
  FetchTodosProvider call({required int page, String title = ""}) {
    return FetchTodosProvider(page: page, title: title);
  }

  @override
  FetchTodosProvider getProviderOverride(
    covariant FetchTodosProvider provider,
  ) {
    return call(page: provider.page, title: provider.title);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchTodosProvider';
}

/// See also [fetchTodos].
class FetchTodosProvider extends AutoDisposeFutureProvider<List<Todo>> {
  /// See also [fetchTodos].
  FetchTodosProvider({required int page, String title = ""})
    : this._internal(
        (ref) => fetchTodos(ref as FetchTodosRef, page: page, title: title),
        from: fetchTodosProvider,
        name: r'fetchTodosProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$fetchTodosHash,
        dependencies: FetchTodosFamily._dependencies,
        allTransitiveDependencies: FetchTodosFamily._allTransitiveDependencies,
        page: page,
        title: title,
      );

  FetchTodosProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.title,
  }) : super.internal();

  final int page;
  final String title;

  @override
  Override overrideWith(
    FutureOr<List<Todo>> Function(FetchTodosRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchTodosProvider._internal(
        (ref) => create(ref as FetchTodosRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        title: title,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Todo>> createElement() {
    return _FetchTodosProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchTodosProvider &&
        other.page == page &&
        other.title == title;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchTodosRef on AutoDisposeFutureProviderRef<List<Todo>> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `title` of this provider.
  String get title;
}

class _FetchTodosProviderElement
    extends AutoDisposeFutureProviderElement<List<Todo>>
    with FetchTodosRef {
  _FetchTodosProviderElement(super.provider);

  @override
  int get page => (origin as FetchTodosProvider).page;
  @override
  String get title => (origin as FetchTodosProvider).title;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
