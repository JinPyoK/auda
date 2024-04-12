import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories.g.dart';

enum Categories {
  IT(name: 'IT'),
  cook(name: 'Cook'),
  politics(name: 'Politics'),
  travel(name: 'Travel'),
  game(name: 'Game'),
  movie(name: 'Movie'),
  music(name: 'Music'),
  culture(name: 'Culture'),
  economy(name: 'Economy'),
  car(name: 'Car');

  final String name;

  const Categories({required this.name});

  static int get lenght => 10;

  static Categories listIndex(int index) {
    switch (index) {
      case 0:
        return Categories.IT;
      case 1:
        return Categories.cook;
      case 2:
        return Categories.politics;
      case 3:
        return Categories.travel;
      case 4:
        return Categories.game;
      case 5:
        return Categories.movie;
      case 6:
        return Categories.music;
      case 7:
        return Categories.culture;
      case 8:
        return Categories.economy;
      case 9:
        return Categories.car;
      default:
        return Categories.IT;
    }
  }
}

@Riverpod(keepAlive: true)
List<bool> categorySelectedList(CategorySelectedListRef ref) {
  List<bool> selected = List.generate(Categories.lenght, (index) => false);
  return selected;
}
