import 'dart:convert';

import 'package:contador_app/services/api_config.dart';

class Product {
  final int id;
  final String nombre;
  final int stock;
  final String descripcion;
  final String precioventa;
  final String? imagenUrl;
  final int idMarca;
  final int idCategoria;
  final String? marca;
  final String? categoria;


  int cantidad = 0;

  final String _baseUrl = 'http://${ApiConfig.baseUrl}';
  final String _defaultImgUrl = 'https://i.stack.imgur.com/GNhxO.png';

  Product({
      required this.id,
      required this.nombre,
      required this.stock,
      required this.descripcion,
      required this.precioventa,
      this.imagenUrl,
      required this.idMarca,
      required this.idCategoria,
      this.marca,
      this.categoria,
  });

  get fullImagenUrl {
    if (imagenUrl != null) {
      return '$_baseUrl$imagenUrl';
    }
    return _defaultImgUrl;
  }

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json["id"],
      nombre: json["nombre"],
      stock: json["stock"],
      descripcion: json["descripcion"],
      precioventa: json["precioventa"],
      imagenUrl: json["imagen_url"],
      idMarca: json["id_marca"],
      idCategoria: json["id_categoria"],
      marca: json["marca"],
      categoria: json["categoria"],
  );
}
