import 'dart:convert';
import './noticias.dart';
import 'package:http/http.dart' as http;

Future<List<Noticia>> fetchNoticia() async {
  final response = await http.get('https://cgn.inf.br/wp-json/wp/v2/posts/?per_page=100');
  List<Noticia> listaNoticias = List();

  for (var i = 0; i < 100; ++i) {
    int id = json.decode(response.body)[i]['id'] as int;
    String title = json.decode(response.body)[i]['title']['rendered'].toString();
    String img = json.decode(response.body)[i]['fimg_url'].toString();
    if (img == "false") {
      img = "https://www.termoparts.com.br/wp-content/uploads/2017/10/no-image.jpg";
    }
    List categoria = json.decode(response.body)[i]['categories_names'];
    Noticia noticiaJson = Noticia(id: id, title: title, img: img, categoria: categoria[0].toString());
    listaNoticias.add(noticiaJson);
  }

  if (response.statusCode == 200) {
    return listaNoticias;
  } else {
    throw Exception('Falha ao carregar');
  }
}