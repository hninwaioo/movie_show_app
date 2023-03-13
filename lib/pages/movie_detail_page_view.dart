import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_show_app/resources/colors.dart';
import 'package:movies_show_app/viewitems/movie_list_tile.dart';
import '../network/datas/movies_api_repository.dart';
import '../network/responses/tmdb_movie.dart';
import '../resources/dimens.dart';
import '../widgets/movie_detail_screen_buttton_view.dart';

class MovieDetailsViewPage extends ConsumerWidget {
  const MovieDetailsViewPage(
      {super.key, required this.movieId, required this.movie});
  final int movieId;
  final TMDBMovie? movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (movie != null) {
      return Container(
          color: HOME_SCREEN_BACKGROUND_COLOR,
          child: (movie != null)
              ?
          CustomScrollView(
            slivers: [

              SliverList(
                  delegate: SliverChildListDelegate(
                      [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                          child: TrailerSectionView(movie),
                        ),
                        SizedBox(height: MARGIN_MEDIUM_LARGE,),

                        SizedBox(height: MARGIN_MEDIUM_LARGE,),


                        SizedBox(height: MARGIN_MEDIUM_LARGE,),


                        SizedBox(height: MARGIN_MEDIUM_2,),

                      ]
                  )
              )
            ],
          )
              :
          Center(
            child: CircularProgressIndicator(),
          )
      );

    }

    else {
      final movieAsync = ref.watch(movieProvider(movieId: movieId));
      return movieAsync.when(
        error: (e, st) => Scaffold(
          appBar: AppBar(
            title: Text(movie?.title ?? 'Error'),
          ),
          body: Center(child: Text(e.toString())),
        ),
        loading: () => Scaffold(
          appBar: AppBar(
            title: Text(movie?.title ?? 'Loading'),
          ),
          body: Column(
            children: const [
              // MovieListTileShimmer(),
            ],
          ),
        ),
        data: (movie) => Scaffold(
          appBar: AppBar(
            title: Text(movie.title??""),
          ),
          body: Column(
            children: [
              MovieListTile(movie: movie,),
            ],
          ),
        ),
      );
    }
  }
}

class TrailerSectionView extends StatelessWidget {

  TMDBMovie? mMovie;
  TrailerSectionView(this.mMovie);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieTimeAndGenreSectionView(
            genreList: mMovie?.genres?.map((genre) => genre.name).toList()?? []
        ),
        StoryLineView(mMovie?.overview),

        SizedBox(height: MARGIN_MEDIUM_2,),
      ],
    );
  }
}

class MovieTimeAndGenreSectionView extends StatelessWidget {
  const MovieTimeAndGenreSectionView({
    Key? key,
    required this.genreList,
  }) : super(key: key);

  final List<String?> genreList;

  @override
  Widget build(BuildContext context) {
    return
      Wrap(
          alignment : WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.horizontal,
          children: _createMovieTimeAndGenreWidget()
      );
  }

  List<Widget> _createMovieTimeAndGenreWidget(){
    List<Widget> widgets = [
      Icon(
        Icons.access_time,
        color: PLAY_BUTTON_COLOR,
      ),
      SizedBox(width: MARGIN_SMALL,),
      Container(
        child:  Text("2hr 30min",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      SizedBox(width: MARGIN_MEDIUM,)
    ];
    widgets.addAll(genreList.map((genre) => GenreChipSectionView(genre??"")).toList());

    widgets.add(
      Icon(Icons.favorite_border_outlined,
        color: Colors.white,),
    );
    return widgets;
  }
}

class GenreChipSectionView extends StatelessWidget {

  final String genreText;
  GenreChipSectionView(this.genreText);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Chip(
            backgroundColor: MOVIE_DETAILS_SCREEN_CHIP_BACKGROUND_COLOR,
            label: Text(
              genreText,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            )
        ),
        SizedBox(width: MARGIN_SMALL,)
      ],
    );
  }
}
