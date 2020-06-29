class Noticia {
  final int id;
  final String img;
  final String title;
  final List categoria;

  Noticia({this.id, this.img, this.title, this.categoria});

  factory Noticia.fromJson(Map json) {
    return Noticia(
      id: json['id'] ?? "",
      title: json['title']['rendered'] ?? "",
      img: json['fimg_url'].toString() ?? "",
      categoria: json['categories_names'] ?? "",
    );
  }
}