import 'package:cgi_test/domain/entities/random_entity.dart';
import 'package:cgi_test/domain/repositories/random_repository.dart';
import 'package:cgi_test/domain/usecases/get_random_data.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'get_random_test.mocks.dart';

@GenerateNiceMocks([MockSpec<RandomRepository>()])

void main(){
  late GetRandomData usecase;
  late MockRandomRepository mockRandomRepository;

  setUp(() {
    mockRandomRepository = MockRandomRepository();
    usecase = GetRandomData(mockRandomRepository);
  });

final rData = 
    RandomEntity(id: "1", content: "Test content", author: "Test author", authorSlug: "Test authorSlug", length: 12, dateAdded: "29/01/2024", dateModified: "30/01/2014");

  test('should get random data from the repository', () async {
    when(mockRandomRepository.getRandomData())
        .thenAnswer((_) async => Right(rData));
 
    final result = await usecase();
    
    expect(result, Right(rData));
    verify(mockRandomRepository.getRandomData());
    verifyNoMoreInteractions(mockRandomRepository);
  });
}