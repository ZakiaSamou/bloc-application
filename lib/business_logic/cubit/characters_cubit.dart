import 'package:bloc/bloc.dart';
import 'package:flutter_application_bloc/data/models/characters.dart';
import 'package:flutter_application_bloc/data/repositories/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
