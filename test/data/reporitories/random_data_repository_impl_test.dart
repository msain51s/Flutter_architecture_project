import 'package:cgi_test/core/errors/server_exception.dart';
import 'package:cgi_test/core/errors/server_failure.dart';
import 'package:cgi_test/data/datasources/random_remote_data_source.dart';
import 'package:cgi_test/data/models/random_data_model.dart';
import 'package:cgi_test/data/repositories/random_repository_impl.dart';
import 'package:cgi_test/domain/entities/random_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'random_data_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<RandomRemoteDataSource>()])
void main() {
  late RandomRepositoryImpl repository;
  late MockRandomRemoteDataSource mockRandomRemoteDataSource;

  setUp(() {
    mockRandomRemoteDataSource = MockRandomRemoteDataSource();
    repository =
        RandomRepositoryImpl(remoteDataSource: mockRandomRemoteDataSource);
  });

  final tModelData = RandomDataModel(
      id: '14',
      content: 'test content',
      author: 'test author',
      authorSlug: 'test authorSlug',
      length: 25,
      dateAdded: '31/01/2024',
      dateModified: '31/01/2024');
  final tEntityData = RandomEntity(
      id: '14',
      content: 'test content',
      author: 'test author',
      authorSlug: 'test authorSlug',
      length: 25,
      dateAdded: '31/01/2024',
      dateModified: '31/01/2024');

  test('should get random data from the remote data source', () async {
    when(mockRandomRemoteDataSource.getRandomData())
        .thenAnswer((_) async => tModelData);

    final result = await repository.getRandomData();

    verify(mockRandomRemoteDataSource.getRandomData());
    expect(result, isA<Right<Failure, RandomEntity>>());
    expect(result, equals(Right<Failure, RandomEntity>(tEntityData)));
  });

  test(
      'should return ServerFailure when the call to remote data source is unsuccessful',
      () async {
    when(mockRandomRemoteDataSource.getRandomData())
        .thenThrow(ServerException());

    final result = await repository.getRandomData();

    expect(result, isA<Left<ServerFailure, RandomEntity>>());
  });
}
