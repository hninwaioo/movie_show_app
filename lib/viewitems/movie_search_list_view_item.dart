import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies_show_app/network/responses/tmdb_movie.dart';
import 'package:movies_show_app/resources/dimens.dart';
import 'package:movies_show_app/resources/strings.dart';
import 'package:movies_show_app/widgets/rating_view.dart';

class MovieSearchListViewItem extends StatefulWidget {
  const MovieSearchListViewItem({
    super.key,
    required this.movie,
    this.movieType,
    this.onPressed,
  });
  final TMDBMovie movie;
  final String? movieType;
  final VoidCallback? onPressed;

  @override
  State<MovieSearchListViewItem> createState() => _MovieSearchListViewItemState();
}

class _MovieSearchListViewItemState extends State<MovieSearchListViewItem> {

  String? formattedMonth ;
  String? formattedDate ;

  @override
  void initState(){
    super.initState();

    final _dayFormatter = DateFormat('d');
    final _monthFormatter = DateFormat('MMM');
    final dateStr = widget.movie.releaseDate;
    var dateTime = new DateFormat("yyyy-MM-dd").parse(dateStr??"");
    formattedMonth = _monthFormatter.format(dateTime);
    formattedDate = _dayFormatter.format(dateTime);

  }
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: MARGIN_SMALL),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: widget.onPressed,
                child:
                Container(
                  margin: EdgeInsets.only(right: MARGIN_MEDIUM),
                  height: 230,
                  width: 150,
                  child:  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      child:
                      Image.network(
                        "$IMAGE_BASE_URL${widget.movie.posterPath}",
                        height: BEST_ACTOR_HEIGHT,
                        fit:BoxFit.fill,
                        width: MOVIE_LIST_ITEM_WIDTH,
                      )
                  )
                ),
            ),

            SizedBox(height: MARGIN_MEDIUM,),

            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      widget.movie.title??"",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: TEXT_REGULAR_2x,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: MARGIN_MEDIUM,),
                    Row(
                      children: [

                        RatingView(ratingAverage: widget.movie.voteAverage??0.0),
                        SizedBox(width: MARGIN_MEDIUM,),
                        Text(
                          widget.movie.voteAverage.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: TEXT_REGULAR
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

          ],
        )
    );
  }
}
