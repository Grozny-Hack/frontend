abstract class Routes {
  static const String main = "/";
  static const String signInPage = "/signIn";
  static const String signUpPage = "/signUp";

  static const String home = '/home';
  static const String category = '/category';
  static const String basket = '/basket';
  static const String profile = '/profile';

  static const String categoryVegetables = '/category/vegetables';
  static const String categoryFruits = '/category/fruits';
  static const String categoryBerries = '/category/berries';
  static const String categoryMeat = '/category/meat';
  static const String categoryMilk = '/category/milk';
  static const String categoryBread = '/category/bread';
}

enum MenuRoute {
  home('/home'),
  category('/category'),
  basket('/basket'),
  profile('/profile');

  final String path;
  const MenuRoute(this.path);
}
