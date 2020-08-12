
import 'package:app_shoe/core/const.dart';
import 'package:flutter/material.dart';

class ShoeModel {
  final String name;
  final num price;
  final String desc;
  final String brand;
  final String imgPath;
  final String id;

  ShoeModel({
    this.name,
    this.price,
    this.desc,
    this.brand,
    this.imgPath,
    this.id,
  });

  ShoeModel.fromMap(Map<dynamic, dynamic> json, this.id)
      : brand = json['brand'],
        desc = json['desc'],
        imgPath = json['imgPath'],
        name = json['name'],
        price = json['price'];

//  static List<ShoeModel> list = [
//    ShoeModel(
//      name: "Nike Air Jordan 1 Retro High",
//      desc:
//      "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
//      price: 184,
//      color: AppColors.blueColor,
//      brand: "Nike",
//      imgPath: "2.png",
//    ),
//    ShoeModel(
//      name: "Converse X OPI Chuck Taylor",
//      desc:
//      "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
//      price: 123,
//      color: AppColors.yellowColor,
//      brand: "Converse",
//      imgPath: "1.png",
//    ),
//    ShoeModel(
//      name: "Nike Air Jordan 1 Retro High",
//      desc:
//      "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
//      price: 135,
//      color: AppColors.redColor,
//      brand: "Nike",
//      imgPath: "3.png",
//    ),
//  ];
}