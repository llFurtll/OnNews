import 'dart:convert';
import './noticias.dart';
import 'package:http/http.dart' as http;

Future<List<Noticia>> fetchNoticia() async {
  final response =
      await http.get('https://cgn.inf.br/wp-json/wp/v2/posts/?per_page=100');

  List<Noticia> listaNoticias = List();

  String semImagem = "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Item_sem_imagem.svg/1024px-Item_sem_imagem.svg.png";

  var noticias = json.decode(response.body);

  noticias.asMap().forEach((index, value) {
    if (noticias[index]['fimg_url'].toString() == "false") {
      noticias[index]['fimg_url'] = semImagem;
    }
    listaNoticias.add(Noticia.fromJson(noticias[index]));
  });

  if (response.statusCode == 200) {
    return listaNoticias;
  } else {
    throw Exception('Falha ao carregar');
  }
}

Future<List<Noticia>> fetchNoticiaCategoria(String categoria) async {
  final response = await http.get(
      "https://cgn.inf.br/wp-json/wp/v2/posts?per_page=100&categories=$categoria");

  List<Noticia> listaNoticias = List();

  String semImagem = "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Item_sem_imagem.svg/1024px-Item_sem_imagem.svg.png";

  var noticias = json.decode(response.body);

  noticias.asMap().forEach((index, value) {
    if (noticias[index]['fimg_url'].toString() == "false") {
      noticias[index]['fimg_url'] = semImagem;
    }
    listaNoticias.add(Noticia.fromJson(noticias[index]));
  });

  if (response.statusCode == 200) {
    return listaNoticias;
  } else {
    throw Exception('Falha ao carregar');
  }
}
