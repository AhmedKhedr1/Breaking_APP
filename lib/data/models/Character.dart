class CharacterModel {
  final int CahrId;
  final String Name;
  final String Status;
  final String SpeCies;
  final String Gender;
  final String image;
  final Map<String, dynamic> origin;
  final Map<String, dynamic> location;
  final List<dynamic> episode;

  CharacterModel({
    required this.CahrId,
    required this.Name,
    required this.Status,
    required this.SpeCies,
    required this.Gender,
    required this.image,
    required this.origin,
    required this.location,
    required this.episode,
  });

  factory CharacterModel.fromJson(jsondata) {
    return CharacterModel(
        CahrId:jsondata['id'],
        Name:jsondata['name'],
        Gender: jsondata['gender'],
        SpeCies: jsondata['species'],
        Status: jsondata['status'],
        episode:jsondata['episode'] ,
        image: jsondata['image'],
        location:jsondata['location'],
        origin: jsondata['origin']);
  }
}
