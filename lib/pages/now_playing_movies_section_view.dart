import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_show_app/network/datas/movies_api_repository.dart';
import 'package:movies_show_app/network/datas/movies_pagination.dart';
import 'package:movies_show_app/routing/app_router.dart';
import 'package:movies_show_app/viewitems/movie_list_tile.dart';
import 'package:movies_show_app/viewitems/movie_list_tile_shimmer.dart';

class NowPlayingMoviesSectionView extends ConsumerWidget {

  const NowPlayingMoviesSectionView(
      {super.key, required this.movieType});
  final String movieType;
  static const pageSize = 20;

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Expanded(
        child: RefreshIndicator(
        onRefresh: () {
          // dispose all the pages previously fetched. Next read will refresh them
          ref.invalidate(
              fetchMoviesProvider
          );
          // keep showing the progress indicator until the first page is fetched
          return ref.read(
            fetchMoviesProvider
              (
              pagination: MoviesPagination("",page: 1),
            ).future,
          );
        },

          child: GridView.custom(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 15.0,

            ),
            childrenDelegate: SliverChildBuilderDelegate((context, index) {
              final page = index ~/ pageSize + 1;
              final indexInPage = index % pageSize;
              // use the fact that this is an infinite list to fetch a new page
              // as soon as the index exceeds the page size
              // Note that ref.watch is called for up to pageSize items
              // with the same page and query arguments (but this is ok since data is cached)
              final moviesList = ref.watch(
                fetchMoviesProvider(
                    pagination: MoviesPagination("",page: page)),
              );
              return moviesList.when(
                // TODO: Improve error handling
                error: (err, stack) => Text('Error $err'),
                loading: () => const MovieListTileShimmer(),
                data: (movies) {
                  if (indexInPage >= movies.length) {
                    return const MovieListTileShimmer();
                  }
                  final movie = movies[indexInPage];
                  return MovieListTile(
                    movie: movie,
                    movieType: movieType,
                    onPressed: () => context.goNamed(
                      AppRoute.now_playing_movie.name,
                      params: {'id': movie.id.toString()},
                      extra: movie,
                    ),
                  );
                },
              );
            }),
          ),
        ),
    );
  }
}
