class Client {
  int id;
  String name;
  String account;
  String agency;
  List<FavoriteItem> favorites;

  Client(
      {required this.id,
      required this.name,
      required this.account,
      required this.agency,
      required this.favorites});

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      name: json['name'],
      account: json['account'],
      agency: json['agency'],
      favorites: (json['favorites'] as List)
          .map((itemJson) => FavoriteItem.fromJson(itemJson))
          .toList(),
    );
  }
}

class FavoriteItem {
  String name;
  String icon;

  FavoriteItem({required this.name, required this.icon});

  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    return FavoriteItem(
      name: json['name'],
      icon: json['icon'],
    );
  }
}
