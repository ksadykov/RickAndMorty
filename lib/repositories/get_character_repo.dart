import 'package:dio/dio.dart';
import 'package:rick_and_morty/model/character_model.dart';

class GetCharacterRepo {
  final Dio dio;
  GetCharacterRepo({required this.dio});

  Future<CharacterModel> getCharacterData(int page) async {
    final response = await dio.get('/character/', queryParameters: {
      'page': page ?? 0,
    });
    return CharacterModel.fromJson(response.data);
  }
}
