import 'package:mysql1/mysql1.dart';

class Dishes {
  String id;
  String name;
  String imageUrl;
  String rating;
  String isFav;
  // ignore: sort_constructors_first
  Dishes({this.id, this.name, this.imageUrl, this.rating, this.isFav});

  Map toJson() => {
        'name': name,
        'id': id,
        'imageUrl': imageUrl,
        'rating': rating,
        'isFav': isFav
      };

  List<Dishes> parseResponse(Results results) {
    List<Dishes> _resObj = List<Dishes>();
    for (var row in results) {
      _resObj.add(Dishes(
        id: row['id'].toString(),
        imageUrl: row['image'].toString(),
        name: row['name'].toString(),
        rating: row['rating'].toString(),
        isFav: row['isFav'].toString(),
      ));
    }
    return _resObj;
  }
}
