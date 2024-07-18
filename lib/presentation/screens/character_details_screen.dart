import 'package:flutter/material.dart';
import 'package:flutter_application_bloc/constants/my_colors.dart';
import 'package:flutter_application_bloc/data/models/characters.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({super.key, required this.character});
//Image and Name
  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600, //length of the image
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text(
          character.name,
          style: TextStyle(
            color: MyColors.myGrey,
          ),
          //  textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: MyColors.myYellow,
      endIndent: endIndent,
      thickness: 2,
      height: 30,
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo(
                          'episode : ', character.episode.join(' / ')),
                      buildDivider(305),
                      characterInfo('species : ', character.species),
                      buildDivider(305),
                      characterInfo('status : ', character.status),
                      buildDivider(315),
                      characterInfo('gender : ', character.gender),
                      buildDivider(310),
                      character.type.isNotEmpty
                          ? characterInfo('type : ', character.type)
                          : Container(),
                      character.type.isNotEmpty
                          ? buildDivider(320)
                          : Container(),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
