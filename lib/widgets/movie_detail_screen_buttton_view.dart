import 'package:flutter/material.dart';
import 'package:movies_show_app/resources/dimens.dart';
import 'package:movies_show_app/resources/strings.dart';
import 'package:movies_show_app/widgets/typical_text.dart';

class MovieDetailsScreenButtonView extends StatelessWidget {

  final String btnText;
  final Color backgroundColor;
  final Icon buttonIcon;
  final bool isGhostButton;

  MovieDetailsScreenButtonView(
      this.btnText,
      this.backgroundColor,
      this.buttonIcon,
      {this.isGhostButton=false}
      );
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: MARGIN_CARD_MEDIUM_2),
          height: MARGIN_XXLARGE,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(
                  MARGIN_MEDIUM_LARGE
              ),
              border: (isGhostButton)
                  ? Border.all(
                  color: Colors.white,
                  width: 2
              )
                  :null
          ),
          child: Center(
            child: Row(
              children: [
                buttonIcon,
                SizedBox(width: MARGIN_MEDIUM,),
                Flexible(
                  child:Text(
                    btnText,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: TEXT_REGULAR_2x,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          ),
        )

    );

  }
}

class StoryLineView extends StatelessWidget {

  String? storyLine;
  StoryLineView(this.storyLine);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MARGIN_MEDIUM_2,),

          TypicalText(MOVIE_DETAILS_STORYLINE_TITLE, Colors.white,TEXT_REGULAR_2x,isFontWeight700: true,),
          SizedBox(height: MARGIN_MEDIUM_2,),

          Text(
            this.storyLine??"",
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(width: MARGIN_MEDIUM_2,),
        ],
      ),
    );
  }
}

