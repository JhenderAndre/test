import 'package:flutter/material.dart';

class ProductosModel {
  final String nombre;
  final String imagen;
  final Color color;
  final double precio;
  int cantidad;

  ProductosModel({required this.nombre, required this.imagen, required this.color, required this.precio,
      this.cantidad = 1});
}

  // var id;
  //
  // late String nombre;
  // late String imagen;
  // late double precio;
  // late int cantidad;
  //
  // ProductosModel(
  //     String documentoID,
  //     String nombre,
  //     String imagen,
  //     double precio,
  //     int cantidad,
  // );
  //
  // ProductosModel.map(dynamic obj){
  //   this.id = obj['id'];
  //   this.nombre = obj['nombre'];
  //   this.imagen = obj['imagen'];
  //   this.precio = obj['precio'];
  //   this.cantidad = obj['cantidad'];
  // }
  //
  // Map<String, dynamic> toMap(){
  //   var map = new Map<String, dynamic>();
  //
  //   map['id'] = id;
  //   map['nombre'] = nombre;
  //   map['imagen'] = imagen;
  //   map['precio'] = precio;
  //   map['cantidad'] = cantidad;
  //
  //   return map;
  // }
  //
  // ProductosModel.fromMap(Map<String, dynamic> map){
  //   this.nombre = map['nombre'];
  //   this.id = map['id'];
  //   this.imagen = map['imagen'];
  //   this.precio = map['precio'];
  //   this.cantidad = 1;
  // }