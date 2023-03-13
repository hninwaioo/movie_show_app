import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_show_app/network/responses/tmdb_movie.dart';
import 'package:movies_show_app/pages/movie_details_page.dart';
import 'package:movies_show_app/pages/movie_home_page.dart';
import 'package:movies_show_app/pages/movies_search_screen_page.dart';
import 'package:movies_show_app/pages/now_playing_movies_section_view.dart';
import 'package:movies_show_app/pages/popular_movies_section_view.dart';

enum AppRoute {
  now_movies,
  now_playing_movie,
  best_popular_movie,
  popular_movies,
  search_movies
}

/// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/now',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      // TODO: Implement with stateful nested navigation once this PR is merged:
      // https://github.com/flutter/packages/pull/2650

      // GoRoute(
      //   path: '/search',
      //   name: AppRoute.search_movies.name,
      //   pageBuilder: (context, state) => NoTransitionPage(
      //     key: state.pageKey,
      //     child: MoviesSearchScreenPage(movieType: "NOW",),
      //   ),
      // ),

      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MovieHomePage(child: child,);
        },
        routes: [

          /// Now Playing Movies
          GoRoute(
            path: '/now',
            name: AppRoute.now_movies.name,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: NowPlayingMoviesSectionView(movieType: "NOW",),
            ),
            routes: [
              GoRoute(
                path: ':id',
                name: AppRoute.now_playing_movie.name,
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  final id = int.parse(state.params['id'] as String);
                  final movie = state.extra as TMDBMovie?;
                  final isMovieMessage = false;
                  return MaterialPage(
                    key: state.pageKey,
                    child: MovieDetailsPage(movieId: id, movie: movie, movieMessage: isMovieMessage,),
                  );
                },
              )
            ],
          ),
          /// Popular Movies
          GoRoute(
            path: '/popular',
            name: AppRoute.popular_movies.name,
            pageBuilder: (context, state)
            => NoTransitionPage(
              key: state.pageKey,
              child: PopularMoviesSectionView(movieType: "POPULAR"),
            ),

            routes: [
              GoRoute(
                path: ':id',
                name: AppRoute.best_popular_movie.name,
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  final id = int.parse(state.params['id'] as String);
                  final movie = state.extra as TMDBMovie?;
                  final isMovieMessage = true;
                  return MaterialPage(
                    key: state.pageKey,
                    child: MovieDetailsPage(movieId: id, movie: movie,movieMessage: isMovieMessage,),
                  );
                },
              )
            ],
          ),

          // GoRoute(
          //   path: '/search',
          //   name: AppRoute.search_movies.name,
          //   pageBuilder: (context, state) => NoTransitionPage(
          //     key: state.pageKey,
          //     child: MoviesSearchScreenPage(movieType: "NOW",),
          //   ),
          // ),
        ],
      ),
    ],
  );
});
