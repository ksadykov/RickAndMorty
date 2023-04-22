import 'package:dio/dio.dart';
import 'package:rick_and_morty/model/character_model.dart';

class GetCharacterRepo {
  final Dio dio;
  GetCharacterRepo({required this.dio});

  Future<CharacterModel> getCharacterData() async {
    final response = await dio.get('/character/');
    return CharacterModel.fromJson(response.data);
  }
}
