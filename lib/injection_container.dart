import 'package:cgi_test/data/datasources/random_remote_data_source.dart';
import 'package:cgi_test/data/datasources/remote/random_remote_data_source_impl.dart';
import 'package:cgi_test/data/repositories/random_repository_impl.dart';
import 'package:cgi_test/domain/repositories/random_repository.dart';
import 'package:cgi_test/domain/usecases/get_random_data.dart';
import 'package:cgi_test/presentation/bloc/random_data/random_data_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getId = GetIt.instance;

void init() {
  // Bloc
  getId.registerFactory(() => RandomDataBloc(getRandomData: getId()));

  // Use cases
  getId.registerLazySingleton(() => GetRandomData(getId()));

  // Repositories
  getId.registerLazySingleton<RandomRepository>(() => RandomRepositoryImpl(remoteDataSource: getId()));

  // Data sources
  getId.registerLazySingleton<RandomRemoteDataSource>(() => RandomRemoteDataSourceImpl(client: getId()));

  // Http service
    getId.registerLazySingleton(() => http.Client());

}
