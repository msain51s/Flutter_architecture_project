import 'package:cgi_test/core/errors/server_exception.dart';
import 'package:cgi_test/core/errors/server_failure.dart';
import 'package:cgi_test/data/datasources/random_remote_data_source.dart';
import 'package:cgi_test/data/models/random_data_model.dart';
import 'package:cgi_test/domain/entities/random_entity.dart';
import 'package:cgi_test/domain/repositories/random_repository.dart';
import 'package:dartz/dartz.dart';

class RandomRepositoryImpl implements RandomRepository {
  final RandomRemoteDataSource remoteDataSource;

  RandomRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<ServerFailure, RandomEntity>> getRandomData() async {
    try{
    final RandomDataModel randomDataModel =
        await remoteDataSource.getRandomData();
    final RandomEntity randomEntity = randomDataModel.toEntity();

    return Right(randomEntity);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
