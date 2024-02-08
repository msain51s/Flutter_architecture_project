import 'package:cgi_test/data/models/random_data_model.dart';

abstract class RandomRemoteDataSource{
  Future<RandomDataModel> getRandomData();
}