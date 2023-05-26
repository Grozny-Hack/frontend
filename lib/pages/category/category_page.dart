import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/utils/app_routes.dart';

import '../../ui/closeButton.dart';
import '../../utils/app_colors.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f5f5),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const SizedBox(height: 42,),
          const SizedBox(height: 20,),

          const Text('Категории', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),),
          const SizedBox(height: 20,),

          Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27),
                color: Colors.white,
                border: Border.all(color: const Color(0xffD9D0E3))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                TextField(
                  cursorColor: Colors.green,
                  // controller: _textMailSubjectController,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 1,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
                  decoration: InputDecoration(
                      hintText: 'Поиск',
                      hintStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                      ),
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.black,
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              ProductCard(amount: '43', title: 'Овощи', imagePath: 'assets/images/categories/greenShit.jpg', 
              pageRoute: Routes.categoryVegetables,),
              SizedBox(width: 20,),
              ProductCard(amount: '32', title: 'Фрукты', imagePath: 'assets/images/categories/fruits.jpg',
              pageRoute: Routes.categoryFruits),
            ],
          ),
          const SizedBox(height: 20,),
          Row(children: const [
            ProductCard(amount: '22', title: 'Выпечка', imagePath: 'assets/images/categories/bread.jpg',
            pageRoute: Routes.categoryBread),
            SizedBox(width: 20,),
            ProductCard(amount: '56', title: 'Молочное', imagePath: 'assets/images/categories/milk.jpg',
            pageRoute: Routes.categoryMilk),
          ],),
          const SizedBox(height: 20,),
          Row(children: const [
            ProductCard(amount: '31', title: 'Мясо', imagePath: 'assets/images/categories/meat.jpg',
            pageRoute: Routes.categoryMeat),
            SizedBox(width: 20,),
            ProductCard(amount: '16', title: 'Ягоды', imagePath: 'assets/images/categories/strawberry.jpg',
            pageRoute: Routes.categoryBerries),
          ],),
        ]),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.title='', 
    this.amount='',
    this.imagePath='assets/images/categories/greenShit.jpg',
    this.pageRoute=Routes.home});

  final String title;
  final String amount;
  final String imagePath;
  final String pageRoute;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){context.push(pageRoute);},
          child: Container(
            // height: 300,
            width: (MediaQuery.of(context).size.width - 60) / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xffD9D0E3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '($amount)',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff9586A8)),
                        ),
                        // Expanded(child: SizedBox())
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
