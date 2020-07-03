class Noticia {
  final int id;
  final String img;
  final String title;
  final String conteudo;
  final List categoria;

  Noticia({this.id, this.img, this.title, this.conteudo, this.categoria});

  factory Noticia.fromJson(Map json) {
    return Noticia(
      id: json['id'] ?? "",
      title: json['title']['rendered'] ?? "",
      img: json['fimg_url'].toString() ?? "",
      conteudo: json['content']['rendered'],
      categoria: json['categories_names'] ?? "",
    );
  }
}