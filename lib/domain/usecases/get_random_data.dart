import 'package:cgi_test/core/errors/server_failure.dart';
import 'package:cgi_test/domain/entities/random_entity.dart';
import 'package:cgi_test/domain/repositories/random_repository.dart';
import 'package:dartz/dartz.dart';

class GetRandomData{
  final RandomRepository randomRepository;

  GetRandomData(this.randomRepository);

  Future<Either<ServerFailure, RandomEntity>> call() async {
    return await randomRepository.getRandomData();
  }
}