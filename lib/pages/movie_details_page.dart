import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:movies_show_app/network/datas/movies_api_repository.dart';
import 'package:movies_show_app/network/responses/tmdb_movie.dart';
import 'package:movies_show_app/resources/colors.dart';
import 'package:movies_show_app/resources/dimens.dart';
import 'package:movies_show_app/resources/strings.dart';
import 'package:movies_show_app/viewitems/movie_list_tile.dart';
import 'package:movies_show_app/viewitems/movie_poster.dart';
import 'package:movies_show_app/widgets/movie_detail_screen_buttton_view.dart';
import 'package:movies_show_app/widgets/typical_text.dart';
import 'package:movies_show_app/widgets/rating_view.dart';
import 'package:intl/intl.dart';
import '../widgets/movie_detail_message_view.dart';
import '../widgets/explict_animation_favourite_icon_button.dart';

class MovieDetailsPage extends ConsumerWidget {
  const MovieDetailsPage(
      {super.key, required this.movieId, required this.movie, required this.movieMessage});
  final int movieId;
  final TMDBMovie? movie;
  final bool movieMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (movie != null) {
      return
        Stack(
          children: [

            Positioned.fill(
              child: Container(
                  color: PRIMARY_COLOR,
                  child: (movie !=null)
                      ?
                  CustomScrollView(
                    slivers: [
                      MovieDetailsSliverAppBarView(
                              () => Navigator.pop(context),
                          movie
                      ),

                      SliverList(
                          delegate: SliverChildListDelegate(
                              [
                                SizedBox(height: MARGIN_MEDIUM_2,),
                                MoviesReleaseDateView(movie?.releaseDate??""),
                                SizedBox(height: MARGIN_MEDIUM,),

                                Visibility(
                                  visible: movieMessage,
                                  child: MovieDetailMessageView(),
                                ),

                                SizedBox(height: MARGIN_MEDIUM,),
                                StoryLineView(movie?.overview??""),

                                SizedBox(height: MARGIN_MEDIUM,),


                                // CastSectionView(
                                //     castList: mCastList??[]
                                // ),
                              ]
                          )
                      )
                    ],
                  )
                      : Center(child: CircularProgressIndicator(),
                  )
              ),
            ),

          ],
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
              MovieDetailsPage(movieId: movieId, movie: movie, movieMessage: movieMessage,),
            ],
          ),
        ),
      );
    }
  }
}



class MovieDetailsSliverAppBarView extends StatelessWidget {

  final Function onTapBack;
  TMDBMovie? mMovie;
  MovieDetailsSliverAppBarView(this.onTapBack,this.mMovie);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: PRIMARY_COLOR,
      expandedHeight: MOVIE_DETAILS_SCREEN_APP_BAR_HEIGHT,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned(
                top: 0.0,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height/3.5,
                child: MovieDetailsAppBarImageView(mMovie?.backdropPath??"")
            ), //Positioned
            /** Positioned WIdget **/

            Positioned(
                top: 160,
                left: 16,
                child:
                MoviePoster(imagePath: mMovie?.posterPath)
            ), //Positioned

            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MARGIN_XXLARGE,
                    left: MARGIN_MEDIUM_2
                ),
                child: BackButtonView(
                        () => onTapBack()
                ),
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MARGIN_XXLARGE+MARGIN_MEDIUM,
                    right: MARGIN_MEDIUM_LARGE
                ),
                child: ExplicitAnimationFavouriteIconButton()
                // FavouriteButtonView(),
              ),
            ),

            Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.only(left: MARGIN_MEDIUM),
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(
                      left: MARGIN_MEDIUM_LARGE
                  ),
                  // color: PRIMARY_COLOR,
                  height: 220,
                  width: MediaQuery.of(context).size.width/1.6,
                  child: MoviesTypesView(
                    movieVO: mMovie,
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}

class ImageOverlapView extends StatelessWidget {
  String mImageUrl;
  ImageOverlapView(this.mImageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Row(
        children: [
          Image.network(
            "$IMAGE_BASE_URL$mImageUrl",
            height: BEST_ACTOR_HEIGHT,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class MoviesTypesView extends StatelessWidget {

  TMDBMovie? movieVO;

  MoviesTypesView({this.movieVO});
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            movieVO?.originalTitle??"",
            style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2x,
                fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: MARGIN_SMALL,),

          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(width: MARGIN_SMALL,),

              TypicalText("${movieVO?.voteCount} VOTES", Colors.white, TEXT_REGULAR_VERY_SMALL,isFontWeight: false),

              SizedBox(width: MARGIN_MEDIUM,),
              TypicalText(movieVO?.voteAverage.toString()??"", Colors.white, TEXT_REGULAR_2x,isFontWeight500: true),

            ],
          ),

          SizedBox(height: MARGIN_SMALL,),
          TypicalText("2D,3D,3D IMAX,3D DBOX",Colors.white,TEXT_REGULAR,isFontWeight700: true,),
          SizedBox(height: MARGIN_SMALL,),
          MoviesTypesList(
              genreList: movieVO?.genres?.map((genre) => genre.name).toList()?? []
          ),
        ],
      ),
    );
  }
}

class MoviesTypesList extends StatelessWidget {
  const MoviesTypesList({
    Key? key,
    required this.genreList,
  }) : super(key: key);
  final List<String?> genreList;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children:
        genreList.map((genre) => GenreChipView(genre??""))
            .toList()
    );
  }
}

class MovieDetailsAppBarImageView extends StatelessWidget {

  String mImageUrl;
  MovieDetailsAppBarImageView(this.mImageUrl);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            child: Image.network(
              "$IMAGE_BASE_URL$mImageUrl",
              height: MediaQuery.of(context).size.height/3,//2,
              fit: BoxFit.cover,
            )
        ),
        Align(
            alignment: Alignment.center,
            child: Icon(Icons.play_circle, color: Colors.amberAccent, size: BANNER_PLAY_BUTTON_SIZE,)
        )
      ],
    );
  }
}

class FavouriteButtonView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite_border,
      color: Colors.white,
      size: MARGIN_XLARGE,
    );
  }
}

class BackButtonView extends StatelessWidget {
  final Function onTapBack;
  BackButtonView(this.onTapBack);
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: (){
          onTapBack();
        },
        child: Container(
          width: MARGIN_XXLARGE,
          height: MARGIN_XXLARGE,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black54
          ),
          child: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: MARGIN_XLARGE,
          ),
        ),
      );

  }
}

class GradientView extends StatelessWidget {
  const GradientView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                HOME_SCREEN_BACKGROUND_COLOR
              ]
          )
      ),
    );
  }
}

class MovieDetailAppBarInfoView extends StatelessWidget {

  TMDBMovie? mMovie;
  MovieDetailAppBarInfoView(this.mMovie);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            MovieDetailYearView(mMovie?.releaseDate?.substring(0,4)),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RatingView(),
                    SizedBox(height: MARGIN_SMALL,),
                    TypicalText("${mMovie?.voteCount} VOTES", Colors.white,TEXT_REGULAR_2x),
                    SizedBox(height: MARGIN_CARD_MEDIUM_2,)
                  ],
                ),
                SizedBox(width: MARGIN_MEDIUM_2,),
                Text(
                  "${mMovie?.voteAverage}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MOVIE_DETAILS_RATING_TEXT_SIZE,

                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(height: MARGIN_MEDIUM,),
        Text(
          mMovie?.title?? "",
          style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_HEADING_2X,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}

class MovieDetailYearView extends StatelessWidget {

  String? year;
  MovieDetailYearView(this.year);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      height: MARGIN_XXLARGE,
      decoration: BoxDecoration(
        color: PLAY_BUTTON_COLOR,
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM_LARGE),
      ),
      child: Center(
        child: Text(
          year?? "",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}





class GenreChipView extends StatelessWidget {

  final String genreText;
  GenreChipView(this.genreText);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Chip(
            backgroundColor: Colors.blue,
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

class MoviesReleaseDateView extends StatefulWidget {

  String releaseDate;
  MoviesReleaseDateView(this.releaseDate);

  @override
  State<MoviesReleaseDateView> createState() => _MoviesReleaseDateViewState();
}

class _MoviesReleaseDateViewState extends State<MoviesReleaseDateView> {

  String? formattedDate ;

  @override
  void initState(){
    super.initState();

    final _dateFormatter = DateFormat('dd/MMM/yyyy');
    final dateStr = widget.releaseDate;
    var dateTime = new DateFormat("yyyy-MM-dd").parse(dateStr??"");
    formattedDate = _dateFormatter.format(dateTime);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Flexible(
          child:
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MoviesDurationView("Censor Rating","U/A"),
              Spacer(),
              MoviesDurationView("Release date", formattedDate??""),
              Spacer(),
              MoviesDurationView("Duration","2hr 15min")
            ],
          )
      ),
    );
  }
}

class MoviesDurationView extends StatelessWidget {

  final String text_1;
  final String text;
  MoviesDurationView(this.text_1,this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(MARGIN_MEDIUM,MARGIN_MEDIUM_2,MARGIN_MEDIUM,MARGIN_MEDIUM_2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(34, 34, 34, 1.0),
                Color.fromRGBO(17, 17, 17, 1.0)
              ]
          )
      ),

      child: Column(
        children: [
          TypicalText(text_1, Colors.white, TEXT_REGULAR_SMALL,isFontWeight: true,),
          SizedBox(height: MARGIN_SMALL,),
          TypicalText(text, Colors.white, TEXT_REGULAR,isFontWeight: true,)

        ],
      ),
    );
  }
}
