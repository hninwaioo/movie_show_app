// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_api_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$moviesRepositoryHash() => r'268c6b75dd6c95085303100a3787bbdf4a49963f';

/// See also [moviesRepository].
@ProviderFor(moviesRepository)
final moviesRepositoryProvider = AutoDisposeProvider<MoviesRepository>.internal(
  moviesRepository,
  name: r'moviesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$moviesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MoviesRepositoryRef = AutoDisposeProviderRef<MoviesRepository>;
String _$movieHash() => r'a84110beb4fdebcf3fa74dfcb6879ea287bc915c';

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

typedef MovieRef = AutoDisposeFutureProviderRef<TMDBMovie>;

/// Provider to fetch a movie by ID
///
/// Copied from [movie].
@ProviderFor(movie)
const movieProvider = MovieFamily();

/// Provider to fetch a movie by ID
///
/// Copied from [movie].
class MovieFamily extends Family<AsyncValue<TMDBMovie>> {
  /// Provider to fetch a movie by ID
  ///
  /// Copied from [movie].
  const MovieFamily();

  /// Provider to fetch a movie by ID
  ///
  /// Copied from [movie].
  MovieProvider call({
    required int movieId,
  }) {
    return MovieProvider(
      movieId: movieId,
    );
  }

  @override
  MovieProvider getProviderOverride(
    covariant MovieProvider provider,
  ) {
    return call(
      movieId: provider.movieId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'movieProvider';
}

/// Provider to fetch a movie by ID
///
/// Copied from [movie].
class MovieProvider extends AutoDisposeFutureProvider<TMDBMovie> {
  /// Provider to fetch a movie by ID
  ///
  /// Copied from [movie].
  MovieProvider({
    required this.movieId,
  }) : super.internal(
          (ref) => movie(
            ref,
            movieId: movieId,
          ),
          from: movieProvider,
          name: r'movieProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieHash,
          dependencies: MovieFamily._dependencies,
          allTransitiveDependencies: MovieFamily._allTransitiveDependencies,
        );

  final int movieId;

  @override
  bool operator ==(Object other) {
    return other is MovieProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fetchMoviesHash() => r'cd39a67f8cc6a104d1058189f2151834a8eac1d0';
typedef FetchMoviesRef = AutoDisposeFutureProviderRef<List<TMDBMovie>>;

/// Provider to fetch paginated movies data
///
/// Copied from [fetchMovies].
@ProviderFor(fetchMovies)
const fetchMoviesProvider = FetchMoviesFamily();

/// Provider to fetch paginated movies data
///
/// Copied from [fetchMovies].
class FetchMoviesFamily extends Family<AsyncValue<List<TMDBMovie>>> {
  /// Provider to fetch paginated movies data
  ///
  /// Copied from [fetchMovies].
  const FetchMoviesFamily();

  /// Provider to fetch paginated movies data
  ///
  /// Copied from [fetchMovies].
  FetchMoviesProvider call({
    required MoviesPagination pagination,
  }) {
    return FetchMoviesProvider(
      pagination: pagination,
    );
  }

  @override
  FetchMoviesProvider getProviderOverride(
    covariant FetchMoviesProvider provider,
  ) {
    return call(
      pagination: provider.pagination,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchMoviesProvider';
}

/// Provider to fetch paginated movies data
///
/// Copied from [fetchMovies].
class FetchMoviesProvider extends AutoDisposeFutureProvider<List<TMDBMovie>> {
  /// Provider to fetch paginated movies data
  ///
  /// Copied from [fetchMovies].
  FetchMoviesProvider({
    required this.pagination,
  }) : super.internal(
          (ref) => fetchMovies(
            ref,
            pagination: pagination,
          ),
          from: fetchMoviesProvider,
          name: r'fetchMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchMoviesHash,
          dependencies: FetchMoviesFamily._dependencies,
          allTransitiveDependencies:
              FetchMoviesFamily._allTransitiveDependencies,
        );

  final MoviesPagination pagination;

  @override
  bool operator ==(Object other) {
    return other is FetchMoviesProvider && other.pagination == pagination;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pagination.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fetchPopularMoviesHash() =>
    r'10d69e323d8201411a264ae2c359087b710099a0';
typedef FetchPopularMoviesRef = AutoDisposeFutureProviderRef<List<TMDBMovie>>;

/// Provider to fetch Popular Movies
///
/// Copied from [fetchPopularMovies].
@ProviderFor(fetchPopularMovies)
const fetchPopularMoviesProvider = FetchPopularMoviesFamily();

/// Provider to fetch Popular Movies
///
/// Copied from [fetchPopularMovies].
class FetchPopularMoviesFamily extends Family<AsyncValue<List<TMDBMovie>>> {
  /// Provider to fetch Popular Movies
  ///
  /// Copied from [fetchPopularMovies].
  const FetchPopularMoviesFamily();

  /// Provider to fetch Popular Movies
  ///
  /// Copied from [fetchPopularMovies].
  FetchPopularMoviesProvider call({
    required MoviesPagination pagination,
  }) {
    return FetchPopularMoviesProvider(
      pagination: pagination,
    );
  }

  @override
  FetchPopularMoviesProvider getProviderOverride(
    covariant FetchPopularMoviesProvider provider,
  ) {
    return call(
      pagination: provider.pagination,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchPopularMoviesProvider';
}

/// Provider to fetch Popular Movies
///
/// Copied from [fetchPopularMovies].
class FetchPopularMoviesProvider
    extends AutoDisposeFutureProvider<List<TMDBMovie>> {
  /// Provider to fetch Popular Movies
  ///
  /// Copied from [fetchPopularMovies].
  FetchPopularMoviesProvider({
    required this.pagination,
  }) : super.internal(
          (ref) => fetchPopularMovies(
            ref,
            pagination: pagination,
          ),
          from: fetchPopularMoviesProvider,
          name: r'fetchPopularMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPopularMoviesHash,
          dependencies: FetchPopularMoviesFamily._dependencies,
          allTransitiveDependencies:
              FetchPopularMoviesFamily._allTransitiveDependencies,
        );

  final MoviesPagination pagination;

  @override
  bool operator ==(Object other) {
    return other is FetchPopularMoviesProvider &&
        other.pagination == pagination;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pagination.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
