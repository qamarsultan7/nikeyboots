// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';

const double ICONSIZE = 40;
const Color KCONTANTBLUECOLOR = Color(0xff5B9EE1);
const Color KCONTANTDRAWERCOLOR = Color.fromARGB(255, 3, 72, 106);
const Color KCONSTANTWHITECOLOR = Color.fromARGB(255, 255, 255, 255);
const Color KCONTANTSCAFFOLDCOLOR = Color.fromARGB(255, 243, 243, 244);
EdgeInsets KCONSTANTPADDING = const EdgeInsets.all(20);
const Duration KCONSTANTDURATION = Duration(milliseconds: 800);

class Categories {
  final String title;
  final String image;
  Categories({required this.title, required this.image});
}

List<Categories> popular_list = [
  Categories(title: 'Nike Jordan', image: 'Assets/images/Nikee/popular_1.png'),
  Categories(title: 'Nike Air max', image: 'Assets/images/Nikee/popular_2.png')
];
List<Categories> categories_list = [
  Categories(title: 'Nike', image: 'Assets/images/Categories/nikee.svg'),
  Categories(title: 'Puma', image: 'Assets/images/Categories/puma.svg'),
  Categories(
      title: 'Armour', image: 'Assets/images/Categories/under_armour.svg'),
  Categories(title: 'Addidas', image: 'Assets/images/Categories/addidas.svg'),
  Categories(title: 'Converse', image: 'Assets/images/Categories/converse.svg')
];

class Onboarding {
  final String image;
  final String heading;
  final String description;
  Onboarding(
      {required this.image, required this.heading, required this.description});
}

List<Onboarding> onboarding = [
  Onboarding(
      image: 'Assets/images/onboard_1.png',
      heading: 'Start Journey \nwith Nike',
      description: 'Smart,Gorgeous,Fashionable\nCollection'),
  Onboarding(
      image: 'Assets/images/onboard_2.png',
      heading: 'Follow Latest \nStyle Shoes',
      description: 'There are many beautiful and attractive\nDesigns'),
  Onboarding(
      image: 'Assets/images/onboard_3.png',
      heading: 'Summer Shoes \nNikee 2024',
      description: 'There are many beautiful and Comfortable\nDesigns'),
];

List<Categories> side_menu = [
  Categories(title: 'HomePage', image: 'Assets/Icons/home.svg'),
  Categories(title: 'Favourite', image: 'Assets/Icons/heart.svg'),
  Categories(title: 'Notifications', image: 'Assets/Icons/notifications.svg'),
  Categories(title: 'Profile', image: 'Assets/Icons/user.svg'),
  Categories(title: 'My Cart', image: 'Assets/Icons/shopping bag.svg'),
  Categories(title: 'Orders', image: 'Assets/Icons/Fats Delivery.svg'),
];

class ProductModel {
  final int id;
  final String title;
  final String img;
  final String price;
  ProductModel(
      {required this.id,
      required this.title,
      required this.img,
      required this.price});
}

List<ProductModel> produts = [
  ProductModel(
      id: 1,
      title: 'Nikee Air Jordan',
      img: 'Assets/images/Nikee/nikee_1.png',
      price: '200'),
  ProductModel(
      id: 2,
      title: 'Nikee Air Jordan',
      img: 'Assets/images/Nikee/nikee_2.png',
      price: '600'),
  ProductModel(
      id: 3,
      title: 'Nikee Air Jordan',
      img: 'Assets/images/Nikee/nikee_3.png',
      price: '500'),
  ProductModel(
      id: 4,
      title: 'Nikee Air Jordan',
      img: 'Assets/images/Nikee/nikee_4.png',
      price: '300'),
  ProductModel(
      id: 5,
      title: 'Nikee Air Jordan',
      img: 'Assets/images/Nikee/nikee_5.png',
      price: '100'),
  ProductModel(
      id: 6,
      title: 'Nikee Air Jordan',
      img: 'Assets/images/Nikee/nikee_6.png',
      price: '500'),
  ProductModel(
      id: 7,
      title: 'Nikee Air Jordan',
      img: 'Assets/images/Nikee/nikee_7.png',
      price: '700'),
  ProductModel(
      id: 8,
      title: 'Nikee Air Jordan',
      img: 'Assets/images/Nikee/nikee_8.png',
      price: '150'),
  ProductModel(
      id: 9,
      title: 'Nikee Air Jordan',
      img: 'Assets/images/Nikee/nikee_9.png',
      price: '120'),
  ProductModel(
      id: 10,
      title: 'Nikee Air Jordan',
      img: 'Assets/images/Nikee/nikee_10.png',
      price: '100'),
];
