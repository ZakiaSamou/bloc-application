import 'package:flutter/material.dart';
import 'package:flutter_application_bloc/business_logic/cubit/characters_cubit.dart';
import 'package:flutter_application_bloc/constants/strings.dart';
import 'package:flutter_application_bloc/data/models/characters.dart';
import 'package:flutter_application_bloc/data/repositories/characters_repository.dart';
import 'package:flutter_application_bloc/data/web_services/character_web_service.dart';
import 'package:flutter_application_bloc/presentation/screens/character_details_screen.dart';
import 'package:flutter_application_bloc/presentation/screens/characters_screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepository =
        CharactersRepository(characterWebServices: CharacterWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharactersCubit(charactersRepository),
            child: CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(character: character));
    }
    return null;
  }
}
