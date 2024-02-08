import 'package:cgi_test/domain/entities/random_entity.dart';

abstract class RandomDataState {}

class RandomDataInitial extends RandomDataState{}

class RandomDataLoading extends RandomDataState{}

class RandomDataLoaded extends RandomDataState{
  final RandomEntity randomEntity;

  RandomDataLoaded(this.randomEntity);
}

class RandomDataError extends RandomDataState{
  final String  message;

  RandomDataError(this.message);
}