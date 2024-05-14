
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:salt_code_test/data/datasource/local/news_local_datasource_impl.dart';
import 'package:utils/utils.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late NewsLocalDataSourceImpl dataSource;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource = NewsLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });
  group("cache news", () {
    test(
      'should call database helper to save data',
      () async {
        // arrange
        when(mockDatabaseHelper.clearCache()).thenAnswer((_) async => 1);
        // act
        await dataSource.cahceNews([tNewsCache]);
        // assert
        verify(mockDatabaseHelper.clearCache());
        verify(mockDatabaseHelper.insertCacheTransaction([tNewsCache]));
      },
    );
    test(
      'should return list of news form db when data is exist',
      () async {
        // arrange
        when(mockDatabaseHelper.getNewsCache(tParams))
            .thenAnswer((_) async => [tNewsMap]);
        // act
        final result = await dataSource.getCached(tParams);
        // assert
        expect(result, [tNewsCache]);
      },
    );
    test(
      'should throw CacheException when cache data is not valid',
      () async {
        when(mockDatabaseHelper.getNewsCache(tParams)).thenAnswer((_) async => [
              {"null" : null}
            ]);
        // act
        final call = dataSource.getCached(tParams);
        // assert
        expect(() => call, throwsA(isA<CacheException>()));
      },
    );
  });
}
