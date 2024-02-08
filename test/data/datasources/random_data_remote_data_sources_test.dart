import 'package:cgi_test/core/errors/server_exception.dart';
import 'package:cgi_test/data/datasources/random_remote_data_source.dart';
import 'package:cgi_test/data/datasources/remote/random_remote_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'random_data_remote_data_sources_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late RandomRemoteDataSource dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = RandomRemoteDataSourceImpl(client: mockHttpClient);
  });

  final tUrl = "https://api.quotable.io/random";

  const String sampleApiResponse =
      '{"_id":"MdvEKmt1-ycy","content":"Were here for a reason. I believe a bit of the reason is to throw little torches out to lead people through the dark.","author":"Whoopi Goldberg","tags":["Famous Quotes"],"authorSlug":"whoopi-goldberg","length":117,"dateAdded":"2020-03-15","dateModified":"2023-04-14"}';

  test('should perform a GET request on url to get random data', () async {
    when(mockHttpClient.get(Uri.parse(tUrl))).thenAnswer(
        (_) async => http.Response(sampleApiResponse, 200));

    await dataSource.getRandomData();

    verify(mockHttpClient.get(Uri.parse(tUrl)));
  });

  test('should throw a ServerException when the response code is 404', () async {
    // arrange
    when(mockHttpClient.get(any)).
    thenAnswer((_) async => http.Response('Something went wrong', 404));

    // act
    final call = dataSource.getRandomData;

    // assert
    expect(() => call(), throwsA(isA<ServerException>()));
  });
}
