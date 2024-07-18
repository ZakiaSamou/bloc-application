import 'package:flutter_application_bloc/data/models/characters.dart';
import 'package:flutter_application_bloc/data/web_services/character_web_service.dart';

class CharactersRepository {
  final CharacterWebServices characterWebServices;

  CharactersRepository({required this.characterWebServices});

  Future<List<Character>> getAllCharacters() async {
    final characters = await characterWebServices.getAllCharacters();

    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
