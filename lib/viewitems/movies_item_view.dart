// import 'package:flutter/material.dart';
// import 'package:movies_show_app/resources/colors.dart';
// import 'package:movies_show_app/resources/dimens.dart';
// import 'package:movies_show_app/widgets/movie_item_image.dart';
// import 'package:intl/intl.dart';
//
// class MoviesItemsView extends StatefulWidget {
//   final Function(int) onTapMovie;
//   final MovieVO mMovie;
//   String? playMovies;
//   bool dateVisible;
//   // ConfigResponse configResponse;
//   // CinemaResponse cinemaResponse;
//
//   // ConfigResponse configResponse;
//   List<ConfigDataVO>? configDataList;
//   List<ConfigValueListVO>? configValueList;
//   // CinemaResponse cinemaResponse;
//   List<CinemaVO>? cinemaList;
//   MoviesItemsView(this.onTapMovie,this.mMovie,this.playMovies,this.dateVisible,this.configDataList,this.configValueList,this.cinemaList);
//
//   @override
//   State<MoviesItemsView> createState() => _MoviesItemsViewState();
// }
//
// class _MoviesItemsViewState extends State<MoviesItemsView> {
//
//   String? formattedMonth ;
//   String? formattedDate ;
//
//   @override
//   void initState(){
//     super.initState();
//
//     final _dayFormatter = DateFormat('d');
//     final _monthFormatter = DateFormat('MMM');
//     final dateStr = widget.mMovie.releaseDate;
//     var dateTime = new DateFormat("yyyy-MM-dd").parse(dateStr??"");
//     formattedMonth = _monthFormatter.format(dateTime);
//     formattedDate = _dayFormatter.format(dateTime);
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//         // _navigateToMoviesDetailScreen(context,widget.mMovie.id??0,widget.playMovies??"",widget.configDataList??[],widget.configValueList??[],widget.cinemaList??[]);
//       },
//       child: Container(
//         height: 400,
//         width: 160,
//         padding: EdgeInsets.only(bottom: MARGIN_MEDIUM),
//         decoration: BoxDecoration(
//             color: Colors.black,
//             borderRadius: BorderRadius.all(Radius.circular(8.0),
//             )
//         ),
//
//         child: Wrap(
//           // crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 170,
//               child: Stack(
//                 children: [
//                   Positioned.fill(
//                     child:
//                     MovieItemImage(
//                       "$IMAGE_BASE_URL${widget.mMovie.posterPath}",
//                     ),
//                   ),
//                   Align(
//                       alignment: Alignment.topRight,
//
//                       child: Visibility(
//                         visible: widget.dateVisible,
//                         child: Container(
//                           margin: EdgeInsets.all(MARGIN_MEDIUM),
//                           padding: EdgeInsets.fromLTRB(MARGIN_CARD_MEDIUM_2, MARGIN_MEDIUM, MARGIN_CARD_MEDIUM_2, MARGIN_MEDIUM),
//                           decoration: BoxDecoration(
//                               color: SIGN_PHONE_NUMBER_BUTTON_COLOR,
//                               borderRadius: BorderRadius.circular(15.0)
//                           ),
//                           child: Text("${formattedDate}th\n${formattedMonth}",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 color: MOVIES_TAB_COLOR,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: TEXT_REGULAR_1X
//                             ),),
//                         ),
//                       )
//                   )
//
//                 ],
//               ),
//             ),
//
//             SizedBox(height: MARGIN_MEDIUM,),
//             Container(
//               height: 100,
//               child: MoviesTypeView(movieTitle: widget.mMovie.originalTitle??"",movieVoteAverage: widget.mMovie.voteAverage??0.0,),
//
//             ),
//             SizedBox(height: MARGIN_MEDIUM,),
//
//           ],
//         ),
//       ),
//     );
//
//   }
//
//   // Future<dynamic> _navigateToMoviesDetailScreen(BuildContext context, int movieId,String playMovies, List<ConfigDataVO> configDataList, List<ConfigValueListVO>? configValueList,List<CinemaVO> cinemaList) {
//   //   return Navigator.push(context, MaterialPageRoute(
//   //       builder: (context) => MoviesDetailPage(movieId,playMovies, configDataList, configValueList,cinemaList,)
//   //   )
//   //   );
//   // }
// }