import 'assets.dart';

abstract class PageContent {

  static const List<Map> contentVegetables = [
    {
      'title': 'Капуста',
      'price': '100',
      'pageRoute': '',
      'imagePath': A.cabbage,
    },
    {
      'title': 'Помидоры',
      'price': '250',
      'pageRoute': '',
      'imagePath': A.tomato,
    },
    {
      'title': 'Огурец',
      'price': '',
      'pageRoute': '',
      'imagePath': A.cucumber,
    },
    {
      'title': 'Картофель',
      'price': '34',
      'pageRoute': '',
      'imagePath': A.potato,
    },
  ];

  static const List<Map> contentFruits = [
    {
      'title': 'Ананас',
      'price': '310',
      'pageRoute': '',
      'imagePath': A.ananas,
    },
    {
      'title': 'Лайм',
      'price': '170',
      'pageRoute': '',
      'imagePath': A.lime,
    },
    {
      'title': 'Манго',
      'price': '350',
      'pageRoute': '',
      'imagePath': A.mango,
    },
  ];

  static const List<Map> contentBread = [
    {
      'title': 'Мука',
      'price': '90',
      'pageRoute': '',
      'imagePath': A.flour,
    },
    {
      'title': 'Ржаной хлеб',
      'price': '35',
      'pageRoute': '',
      'imagePath': A.bread2,
    },
    {
      'title': 'Черный хлеб',
      'price': '42',
      'pageRoute': '',
      'imagePath': A.bread1,
    },
  ];

  static const List<Map> contentBerries = [
    {
      'title': 'Абрикосы',
      'price': '130',
      'pageRoute': '',
      'imagePath': A.apricot,
    },
    {
      'title': 'Арбус',
      'price': '65',
      'pageRoute': '',
      'imagePath': A.watermelon,
    },
    {
      'title': 'Ежевика',
      'price': '310',
      'pageRoute': '',
      'imagePath': A.blackberry,
    },
    {
      'title': 'Гранат',
      'price': '210',
      'pageRoute': '',
      'imagePath': A.granat,
    },
  ];

  static const List<Map> contentMilk = [
    {
      'title': 'Молоко',
      'price': '51',
      'pageRoute': '',
      'imagePath': A.milk,
    },
    {
      'title': 'Сыр',
      'price': '420',
      'pageRoute': '',
      'imagePath': A.cheese,
    },
    {
      'title': 'Творог',
      'price': '260',
      'pageRoute': '',
      'imagePath': A.curd,
    },
  ];

  static const List<Map> contentMeat = [
    {
      'title': 'Рибай',
      'price': '810',
      'pageRoute': '',
      'imagePath': A.beaf1,
    },
    {
      'title': 'Стриплойн',
      'price': '620',
      'pageRoute': '',
      'imagePath': A.beaf2,
    },
    {
      'title': 'Лопатка',
      'price': '430',
      'pageRoute': '',
      'imagePath': A.beaf3,
    },
    {
      'title': 'Цыпленок',
      'price': '270',
      'pageRoute': '',
      'imagePath': A.chicken1,
    },
    {
      'title': 'Курица',
      'price': '215',
      'pageRoute': '',
      'imagePath': A.chicken2,
    },
  ];
}