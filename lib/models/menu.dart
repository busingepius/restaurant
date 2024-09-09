
// Menu model
class Menu {
  final int id;
  final String name;
  final String cuisine;

  Menu({required this.id, required this.name, required this.cuisine});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      id: json['id'],
      name: json['name'],
      cuisine: json['cuisine'],
    );
  }
}