
// id - идентификатор дома;
// name - название дома;
// location - название локации;
// description - краткое описание дома;
// type - тип дома (o-frame или a-frame);
// rating - рейтинг (от 0 до 5);
// review_count - количество отзывов;
// images - массив ссылок на изображения дома (может быть пустым);
// price - стоимость аренды в сутки.
enum HomeType {
  o, a,
}

class HomeInfo {
  late int id;
  late int price;
  late int rating;
  late String name;
  late HomeType type;
  late int reviewCount;
  late String location;
  late String description;
  late List<dynamic> imageLinks;

  HomeInfo({
    required this.id, required this.name, required this.location,
    required this.price, required this.rating, required this.imageLinks,
    required this.reviewCount, required this.description, required String homeType,
  }) {
    if (homeType == 'o-frame') {
      type = HomeType.o;
    } else {
      type = HomeType.a;
    }
  }
}
