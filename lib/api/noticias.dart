class Noticia {
  final int id;
  final String img;
  final String title;
  final String categoria;

  Noticia({this.id, this.img, this.title, this.categoria});

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
      id: json['id'] as int,
      title: json['title'] as String
    );
  }
}