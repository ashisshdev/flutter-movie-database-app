import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/usecases/get_top_rated_tvs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockTvRepository mockTvRepository;
  late GetTopRatedTvs usecase;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetTopRatedTvs(mockTvRepository);
  });

  final tTvs = <Tv>[];

  test(
    "should get list of tv from the repository",
    () async {
      // arrange
      when(mockTvRepository.getTopRatedTvs())
          .thenAnswer((_) async => Right(tTvs));

      // act
      final result = await usecase.execute();

      // assert
      expect(result, equals(Right(tTvs)));
    },
  );
}