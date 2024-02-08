import 'dart:convert';

import 'package:cgi_test/core/errors/server_exception.dart';
import 'package:cgi_test/data/datasources/random_remote_data_source.dart';
import 'package:cgi_test/data/models/random_data_model.dart';
import 'package:http/http.dart' as http;

class RandomRemoteDataSourceImpl implements RandomRemoteDataSource{
  final http.Client client;

  RandomRemoteDataSourceImpl({required this.client});

  static const BASE_URL = "https://api.quotable.io/random";

  @override
  Future<RandomDataModel> getRandomData() async {
    final response = await client.get(
      Uri.parse(BASE_URL)
    );

    if(response.statusCode == 200){
      final responseBody = json.decode(response.body);
      final RandomDataModel randomDataModel = RandomDataModel.fromJson(responseBody);

      return randomDataModel;
    }else{
      throw ServerException();
    }
  }

}