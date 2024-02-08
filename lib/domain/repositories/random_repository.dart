import 'package:cgi_test/core/errors/server_failure.dart';
import 'package:cgi_test/domain/entities/random_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RandomRepository{
  Future<Either<ServerFailure, RandomEntity>> getRandomData();
}