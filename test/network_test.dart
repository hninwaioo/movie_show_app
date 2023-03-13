import 'package:movies_show_app/network/responses/tmdb_genre.dart';
import 'package:movies_show_app/network/responses/tmdb_movie.dart';

List<TMDBMovie> getMockMovieForTest(){
  return [

    TMDBMovie(

      false,
        "/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg",
      [28, 12, 878],
         505642,
        "en",
        "Black Panther: Wakanda Forever",
        "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death.  As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.",
        2723.956,
        "/sv1xJUazXeYqALzczSZ3O6nkH75.jpg",
        "2022-11-09",
        "Black Panther: Wakanda Forever",
      false,
        7.3,
        4037,
      []
    ),

    TMDBMovie(
      false,
        "/jr8tSoJGj33XLgFBy6lmZhpGQNu.jpg",
      [ 16,
        12,
        35,
        10751],
        315162,
        "en",
        "Puss in Boots: The Last Wish",
        "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.",
        3180.495,
        "/kuf6dutpsT0vSVehic3EZIqkOBt.jpg",
        "2022-12-07",
        "Puss in Boots: The Last Wish",
      false,
      8.4,
        4496,
      []
    ),

  ];
}

List<TMDBGenres> getMockGenre(){
  return [
    TMDBGenres(id: 1),
    TMDBGenres( id: 2),
    TMDBGenres( id: 3)
  ];
}
