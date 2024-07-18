class Character {
  late int id;
  late String name;
  late String status;
  late String species;
  late String type;
  late String image;
  late String gender;
  late List<dynamic> episode;
  late String url;
  late String created;
  late Map<String, dynamic> origin;
  late Map<String, dynamic> location;

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    image = json['image'];
    gender = json['gender'];
    episode = json['episode'];
    url = json['url'];
    created = json['created'];
    origin = json['origin'];
    location = json['location'];
  }
}
