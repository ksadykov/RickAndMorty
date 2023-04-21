import 'package:dio/dio.dart';
import 'package:rick_and_morty/model/character_model.dart';

class GetCharacterRepo {
  final Dio dio;
  GetCharacterRepo({required this.dio});

  Future<CharacterModel> getCharacterData({required String name}) async {
    final response = await dio.get('character/?name=$name');
    return CharacterModel.fromJson(response.data);
  }

  Future<CharacterModel> nextPage({required String path}) async {
    final response = await dio.get(path);
    return CharacterModel.fromJson(response.data);
  }
}
