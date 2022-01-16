import 'dart:convert';

import 'package:ditonton/data/models/tv_season_episode_model.dart';
import 'package:ditonton/data/models/tv_season_episodes_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

void main() {
  final tTvEpisodeModel = TvSeasonEpisodeModel(
    airDate: '2022-01-01',
    episodeNumber: 1,
    id: 1,
    name: 'Name',
    overview: 'Overview',
    seasonNumber: 1,
    stillPath: '/path.jpg',
    voteAverage: 1.0,
    voteCount: 1,
  );

  final tTvSeasonModel = TvSeasonEpisodesModel(
    tvEpisodes: <TvSeasonEpisodeModel>[tTvEpisodeModel],
  );

  group('from json', () {
    test(
      'should return a valid model from json',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(
          readJson('dummy_data/tv_season.json'),
        );

        // act
        final result = TvSeasonEpisodesModel.fromJson(jsonMap);

        // assert
        expect(result, equals(tTvSeasonModel));
      },
    );
  });

  group('to json', () {
    test(
      'should return a jaon map containing proper data',
      () async {
        // act
        final result = tTvSeasonModel.toJson();

        // assert
        final expectedJsonMap = {
          'episodes': [
            {
              'air_date': '2022-01-01',
              'episode_number': 1,
              'id': 1,
              'name': 'Name',
              'overview': 'Overview',
              'season_number': 1,
              'still_path': '/path.jpg',
              'vote_average': 1.0,
              'vote_count': 1,
            },
          ],
        };

        expect(result, equals(expectedJsonMap));
      },
    );
  });
}