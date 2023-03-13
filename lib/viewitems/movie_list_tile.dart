import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies_show_app/resources/colors.dart';
import 'package:movies_show_app/resources/dimens.dart';
import 'package:movies_show_app/resources/strings.dart';
import 'package:movies_show_app/widgets/movie_item_image.dart';
import 'package:movies_show_app/widgets/rating_view.dart';
import 'package:movies_show_app/widgets/typical_text.dart';
import '../network/responses/tmdb_movie.dart';

class MovieListTile extends StatefulWidget {
  const MovieListTile({
    super.key,
    required this.movie,
    this.movieType,
    this.onPressed,
  });
  final TMDBMovie movie;
  final String? movieType;
  final VoidCallback? onPressed;

  @override
  State<MovieListTile> createState() => _MovieListTileState();
}

class _MovieListTileState extends State<MovieListTile> {
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
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(MARGIN_MEDIUM))
      ),
        padding: EdgeInsets.all(MARGIN_SMALL),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(

              onTap: widget.onPressed,
                child: Container(
                  child: Stack(
                    children: [
                      Positioned(
                        child:
                        MovieItemImage(
                          "$IMAGE_BASE_URL${widget.movie.posterPath}",
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.all(MARGIN_MEDIUM),
                          padding: EdgeInsets.fromLTRB(MARGIN_CARD_MEDIUM_2, MARGIN_MEDIUM, MARGIN_CARD_MEDIUM_2, MARGIN_MEDIUM),
                          decoration: BoxDecoration(
                              color: SIGN_PHONE_NUMBER_BUTTON_COLOR,
                              borderRadius: BorderRadius.circular(15.0)
                          ),
                          child: Text(
                            (widget.movieType == "NOW")?
                            "NOW"
                            : "${formattedDate}th\n${formattedMonth}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: MOVIES_TAB_COLOR,
                                fontWeight: FontWeight.w500,
                                fontSize: TEXT_REGULAR_1X
                            ),),
                        ),
                      )
                    ],
                  ),
                )
            ),

            SizedBox(height: MARGIN_MEDIUM,),

            Container(
              margin: EdgeInsets.all(MARGIN_MEDIUM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  TypicalText(widget.movie.title??"", Colors.white, TEXT_REGULAR_2x, isFontWeight700: true,),
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
