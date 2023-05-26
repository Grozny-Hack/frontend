import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/ui/text_fields.dart';
import 'package:mobile_app/utils/app_colors.dart';

import '../../utils/app_routes.dart';
import '../../utils/assets.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorF6F5F5,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('FoodStock'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 48,
                  color: Colors.grey.shade400,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 109,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) => _saleCard(
                      salesImgPaths[index],
                      salesImgRoutes[index],
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(width: 10), // here the SizedBoxed
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Категории',
                      style: TextStyle(),
                    ),
                    Spacer(),
                    SizedBox(
                      child: Icon(Icons.arrow_right),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 109,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) =>
                        _categoryCard(
                      categoryCardPaths[index],
                      categoryCardRoutes[index],
                      categoryCardTexts[index],
                      categoryCardColor[index],
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(width: 10), // here the SizedBoxed
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(
                          0xFFEAE9E5,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        shape: const CircleBorder(),
                        child: InkWell(
                          splashColor: Color.fromARGB(91, 107, 234, 111),
                          onTap: () {},
                          customBorder: const CircleBorder(),
                          child: Ink(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Image.asset(A.assetsHomePageIsaAvaImg),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          context.push(Routes.isaChatPage);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(
                                  0xFFD9D0E3,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Привет! Я Иса, нажми на меня, чтобы познакомиться. Я буду помогать тебе с любыми вопросами!',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Мои подписки',
                      style: TextStyle(),
                    ),
                    Spacer(),
                    SizedBox(
                      child: Icon(Icons.arrow_right),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 95,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) => _subCard(
                      color: categoryCardColor[index],
                      name: subCardTexts[index],
                      period: subCardPeriod[index],
                      routes: subCardRoutes[index],
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(width: 10), // here the SizedBoxed
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Заказы',
                      style: TextStyle(),
                    ),
                    Spacer(),
                    SizedBox(
                      child: Icon(Icons.arrow_right),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                OrderCard(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<String> salesImgPaths = <String>[
    A.assetsHomeSale1Img,
    A.assetsHomeSale2Img,
    A.assetsHomeSale1Img,
    A.assetsHomeSale2Img,
  ];
  final List<String> salesImgRoutes = <String>[
    Routes.category,
    Routes.category,
    Routes.category,
    Routes.category,
  ];

  final List<String> categoryCardPaths = <String>[
    A.assetsHomePageCotegoryBydonImg,
    A.assetsHomePageCotegoryGreenImg,
    A.assetsHomePageCotegoryAppleImg,
    A.assetsHomePageCotegoryBreadImg,
  ];
  final List<String> categoryCardRoutes = <String>[
    Routes.category,
    Routes.category,
    Routes.category,
    Routes.category,
  ];
  final List<String> categoryCardTexts = <String>[
    'Молочное',
    'Овощи',
    'Фрукты',
    'Выпечка',
  ];
  final List<Color> categoryCardColor = <Color>[
    AppColors.color4AB7B6,
    AppColors.color4B9DCB,
    AppColors.colorAF558B,
    AppColors.colorA187D9,
  ];

  final List<String> subCardTexts = <String>[
    'Неделя',
    'Месяц',
    'Год',
  ];
  final List<String> subCardPeriod = <String>[
    '7',
    '31',
    '365',
  ];
  final List<String> subCardRoutes = <String>[
    Routes.category,
    Routes.category,
    Routes.category,
    Routes.category,
  ];

  Widget _saleCard(String imgPath, String routes) {
    return SizedBox(
      width: 182,
      height: 109,
      child: Stack(
        children: <Widget>[
          Image.asset(
            imgPath,
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  context.go(routes);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryCard(
      String imgPath, String routes, String name, Color color) {
    return Container(
      width: 90,
      height: 96,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Image.asset(
                      imgPath,
                      scale: 5,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '$name',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  context.go(routes);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _subCard({
    required String period,
    required String routes,
    required String name,
    required Color color,
  }) {
    return Container(
      width: 90,
      height: 95,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Text(
                      '$period',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '$name',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  context.go(routes);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget OrderCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivered',
            style: TextStyle(),
          ),
          Text(
            'Пятница 27.05',
            style: TextStyle(),
          ),
          SizedBox(
            height: 45,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 10),
            ),
          ),
          Text(
            'ID заказа : #28292999',
            style: TextStyle(),
          ),
          Text(
            'Сумма :  892р.',
            style: TextStyle(),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFF0BCE83),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {},
                child: Container(
                  width: 131,
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                      child: Text(
                    'Заказать снова',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
