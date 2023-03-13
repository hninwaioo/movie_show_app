import 'package:flutter/material.dart';
import 'package:movies_show_app/resources/dimens.dart';

class MovieItemImage extends StatelessWidget {
  final String movies_image;
  MovieItemImage(this.movies_image);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.only(topLeft:Radius.circular(8.0) ,topRight: Radius.circular(8.0)),
        child:
        Image.network(
          movies_image,
          height: BEST_ACTOR_HEIGHT,
          fit:BoxFit.fill,
          width: MOVIE_LIST_ITEM_WIDTH,
        )
    );
  }
}

// class MoviesTypeView extends StatelessWidget {
//   String movieTitle;
//   double movieVoteAverage;
//   MoviesTypeView({required this.movieTitle, required this.movieVoteAverage});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MOVIE_LIST_ITEM_WIDTH,
//       padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               // TypeText(movieTitle, Colors.white, TEXT_REGULAR_1X,isFontWeight: true),
//               Container(
//                 width: 70,
//                 child: Text(
//                   movieTitle,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   // softWrap: false,
//                   style: TextStyle(
//                       fontSize: TEXT_REGULAR_1X,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold
//                   ),
//                 ),
//               ),
//               Spacer(),
//               Container(
//                 child: Row(
//                   children: [
//                     Image.asset("assets/images/images_im.png",width: 45,height: 35,),
//                     TypicalText(movieVoteAverage.toString(), Colors.white, TEXT_REGULAR_1X,isFontWeight: true),
//                   ],
//                 ),
//               )
//             ],
//           ),
//           SizedBox(height: MARGIN_MEDIUM,),
//           Row(
//             children: [
//               TypicalText("U/A", Colors.white, TEXT_REGULAR_1X,isFontWeight: true),
//               SizedBox(width: MARGIN_MEDIUM,),
//               Image.asset("assets/images/ellipse.png"),
//               SizedBox(width: MARGIN_MEDIUM,),
//               TypicalText("2D,3D,IMAX", Colors.white, TEXT_REGULAR_1X,isFontWeight: true),
//             ],
//           ),
//           SizedBox(height: MARGIN_MEDIUM_2,),
//         ],
//       ),
//     );
//   }
// }
