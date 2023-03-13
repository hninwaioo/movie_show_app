import 'package:flutter/material.dart';
import 'package:movies_show_app/pages/movies_search_screen_page.dart';
import 'package:movies_show_app/resources/colors.dart';
import 'package:movies_show_app/resources/dimens.dart';
import 'package:movies_show_app/routing/app_router.dart';
import 'package:movies_show_app/widgets/typical_text.dart';
import 'package:go_router/go_router.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  List<String> genreList = [
    "Now Playing Movies",
    "Popular Movies",
  ];

  int _selectedIndex = 0;

  void _getNowPlayingAndPopularMovies(BuildContext context, int index) {
    if (index == _selectedIndex) {
      // If the tab hasn't changed, do nothing
      return;
    }
    setState(() => _selectedIndex = index);
    if (index == 0) {
      // Note: this won't remember the previous state of the route
      // More info here:
      // https://github.com/flutter/flutter/issues/99124
      context.goNamed(AppRoute.now_movies.name);
    } else if (index == 1) {
      context.goNamed(AppRoute.popular_movies.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: PRIMARY_COLOR,
        title: TypicalText("The Movies", Colors.white, TEXT_HEADING_2X,isFontWeight500: true,),
        actions: [
          SearchNotificationSectionView()
        ],
        bottom: TabBar(

          indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2,
          indicatorColor: SIGN_PHONE_NUMBER_BUTTON_COLOR,

          labelColor: Colors.white,
          unselectedLabelColor: PRIMARY_HINT_COLOR,
          onTap: (index){
            _getNowPlayingAndPopularMovies(context,index);
          },
          tabs: genreList.map(
                  (genre) => Tab(
                child: Text(genre),
              )
          ).toList(),
        ),
      ),
      body: widget.child,
    )
    );
  }

}

class SearchNotificationSectionView extends StatelessWidget {
  const SearchNotificationSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: MARGIN_MEDIUM_2),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => _navigateMoviesSearchPageScreen(context),
              //   context.goNamed(
              //   AppRoute.search_movies.name,
              // ),
            child: Icon(Icons.search_outlined),
          ),
          SizedBox(width: MARGIN_MEDIUM_2,),
          Icon(Icons.notifications),
          // Icon(Icons.settings_overscan_outlined)
        ],
      ),
    );
  }

  Future<dynamic> _navigateMoviesSearchPageScreen(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(
        builder: (context) => MoviesSearchScreenPage(movieType: "NOW",)
      )
    );
  }
}



