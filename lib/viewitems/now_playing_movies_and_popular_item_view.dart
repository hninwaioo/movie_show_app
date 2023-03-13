import 'package:flutter/material.dart';
import 'package:movies_show_app/resources/dimens.dart';
import 'package:movies_show_app/viewitems/movies_item_view.dart';

// class NowPlayingAndPopularMoviesItemsView extends StatelessWidget {
//   final Function(int) onTapMovie;
//   final List<MovieVO> movieList;
//   String? playMovies;
//   bool dateVisible;
//   // ConfigResponse configResponse;
//   List<ConfigDataVO>? configDataList;
//   List<ConfigValueListVO>? configValueList;
//   // CinemaResponse cinemaResponse;
//   List<CinemaVO>? cinemaList;
//
//   NowPlayingAndPopularMoviesItemsView({
//     required this.onTapMovie,
//     required this.movieList,
//     required this.playMovies,
//     required this.dateVisible,
//     required this.configDataList,
//     required this.configValueList,
//     required this.cinemaList
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
//
//         child: (movieList != null)
//             ?
//         GridView.builder(
//           physics: ScrollPhysics(),
//           scrollDirection: Axis.vertical,
//           shrinkWrap: true,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             childAspectRatio: 0.65,
//             crossAxisCount: 2,
//             crossAxisSpacing: 15.0,
//             mainAxisSpacing: 15.0,
//           ),
//           itemCount: movieList.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Container(
//               child: MoviesItemsView(
//                       (movieId){
//                     this.onTapMovie(movieId);
//                   },
//                   movieList[index],
//                   playMovies,
//                   dateVisible,
//                   configDataList,
//                   configValueList,
//                   cinemaList
//               ),
//             );
//           },
//
//         ): Center(
//           child: CircularProgressIndicator(),
//         )
//     );
//   }
// }
