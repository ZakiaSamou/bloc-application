import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_bloc/constants/my_colors.dart';
import 'package:flutter_application_bloc/constants/strings.dart';
import 'package:flutter_application_bloc/data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, characterDetailsScreen,
              arguments: character);
        },
        child: GridTile(
          child: Hero(
            tag: character.id,
            child: Container(
                color: MyColors.myGrey,
                child: character.image.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: 'assets/images/loading.gif',
                        image: character.image,
                        fit: BoxFit.cover,
                      )
                    : Image.asset('assets/images/placeholder.png')),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${character.name}',
              style: TextStyle(
                height: 1.3,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: MyColors.myWhite,
              ),
              overflow: TextOverflow.ellipsis, //if text is long set .....
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
