import 'package:dio/src/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_show_app/network/datas/movies_api_repository.dart';
import 'package:movies_show_app/network/utils/dio_provider.dart';

import '../network_test.dart';

void main(){

    //Ref ref;
    MoviesRepositoryRef? ref;
    MoviesRepository? moviesRepository;

      moviesRepository =
          MoviesRepository(client: ref!.watch(dioProvider as AlwaysAliveProviderListenable<Dio>), apiKey: 'a92f28e11a27e8e5938a2020be68ba9c',);

    test('Movies Detail Test', () {
      expect(
        moviesRepository?.nowPlayingMovies(page: 1).whenComplete(() => getMockMovieForTest().first),
        true,
      );
    });

}