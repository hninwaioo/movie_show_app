import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_show_app/network/datas/movies_api_repository.dart';
import 'package:movies_show_app/network/datas/movies_pagination.dart';
import 'package:movies_show_app/resources/dimens.dart';
import 'package:movies_show_app/routing/app_router.dart';
import 'package:movies_show_app/viewitems/movie_list_tile_shimmer.dart';
import 'package:movies_show_app/viewitems/movie_search_list_view_item.dart';

class MoviesSearchScreenPage extends ConsumerWidget {
  const MoviesSearchScreenPage(
      {super.key, required this.movieType});
  final String movieType;
  static const pageSize = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(moviesSearchTextProvider);

    return Scaffold(
      appBar: AppBar(
        leading:   GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.grey.shade400,
            size: BACK_BUTTON_SIZE,
          ),
        ),
        title: MoviesSearchBar(),
        centerTitle: false,
      ),

      body: Column(
          children: [
            SizedBox(height: MARGIN_MEDIUM,),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  // dispose all the pages previously fetched. Next read will refresh them
                  ref.invalidate(fetchMoviesProvider);
                  // keep showing the progress indicator until the first page is fetched
                  return ref.read(
                    fetchMoviesProvider(
                      pagination: MoviesPagination(query,page: 1),
                    ).future,
                  );
                },
                /// TODO: Limit item count to pagination results

                child: ListView.custom(
                  childrenDelegate: SliverChildBuilderDelegate((context, index) {
                    final page = index ~/ pageSize + 1;
                    final indexInPage = index % pageSize;
                    // use the fact that this is an infinite list to fetch a new page
                    // as soon as the index exceeds the page size
                    // Note that ref.watch is called for up to pageSize items
                    // with the same page and query arguments (but this is ok since data is cached)
                    final moviesList = ref.watch(
                      fetchMoviesProvider(
                          pagination: MoviesPagination(query,page: page)),
                    );
                    return moviesList.when(
                      // TODO: Improve error handling
                      error: (err, stack) => Text('Error $err'),
                      loading: () =>
                      const MovieListTileShimmer(),
                      data: (movies) {
                        if (indexInPage >= movies.length) {
                          return const MovieListTileShimmer();
                        }
                        final movie = movies[indexInPage];
                        return Container(
                              margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                              padding: EdgeInsets.all(MARGIN_MEDIUM),
                              child: MovieSearchListViewItem(
                              movie: movie,
                              movieType: movieType,
                              onPressed: () => context.goNamed(
                                AppRoute.now_playing_movie.name,
                                params: {'id': movie.id.toString()},
                                extra: movie,
                              ),
                              ),
                          );
                      },
                    );
                  }),
                ),

                // child: GridView.custom(
                //   shrinkWrap: true,
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     childAspectRatio: 0.65,
                //     crossAxisSpacing: 15.0,
                //     mainAxisSpacing: 15.0,
                //
                //   ),
                //   childrenDelegate: SliverChildBuilderDelegate((context, index) {
                //     final page = index ~/ pageSize + 1;
                //     final indexInPage = index % pageSize;
                //     // use the fact that this is an infinite list to fetch a new page
                //     // as soon as the index exceeds the page size
                //     // Note that ref.watch is called for up to pageSize items
                //     // with the same page and query arguments (but this is ok since data is cached)
                //     final moviesList = ref.watch(
                //       fetchMoviesProvider(
                //           pagination: MoviesPagination("",page: page)),
                //     );
                //     return moviesList.when(
                //       // TODO: Improve error handling
                //       error: (err, stack) => Text('Error $err'),
                //       loading: () => const CircularProgressIndicator(),
                //       data: (movies) {
                //         if (indexInPage >= movies.length) {
                //           // return const MovieListTileShimmer();
                //         }
                //         final movie = movies[indexInPage];
                //         return MovieListTile(
                //           movie: movie,
                //           movieType: movieType,
                //           onPressed: () => context.goNamed(
                //             AppRoute.now_playing_movie.name,
                //             params: {'id': movie.id.toString()},
                //             extra: movie,
                //           ),
                //         );
                //       },
                //     );
                //   }),
                // ),

              ),
            ),
          ],
        ),
    );
  }
}

final moviesSearchTextProvider = StateProvider<String>((ref) {
  return '';
});

class MoviesSearchBar extends ConsumerStatefulWidget {
  const MoviesSearchBar({Key? key}) : super(key: key);

  @override
  ConsumerState<MoviesSearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<MoviesSearchBar> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(

        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                        hintText: 'Search movies',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                      ),
                      onEditingComplete: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },

                      onChanged: (text) =>
                        ref
                            .read(moviesSearchTextProvider.notifier)
                            .state = text

                    ),
                  ),
                ),
                Spacer(),
                const Icon(Icons.search, color: Colors.grey),
              ],
            ),
          ),
        ),
    );
  }
}
