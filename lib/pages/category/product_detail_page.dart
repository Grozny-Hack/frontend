import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/utils/app_colors.dart';

import '../../ui/closeButton.dart';
import '../../utils/assets.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, this.content, this.title='---'});

  final String title;
  final List<Map>? content;

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
          CloseCircleButton(onTap: (){context.pop();}),
          const SizedBox(height: 20,),

          Text(title, style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w700),),
          const SizedBox(height: 20,),

          Container(
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(27),
              color: Colors.white,
              border: Border.all(color: const Color(0xffD9D0E3))
            ),
            child: Column(
              children: const [
                TextField(
                  cursorColor: Colors.red,
                  // controller: _textMailSubjectController,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                  decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(height: 66,),

          // ListView.builder(
          //   itemCount: 4,
          //   itemBuilder: (BuildContext context, int index) {
          //     return Container(
          //       height: 50,
          //       color: Colors.amber,
          //       child: Center(child: Text('Entry $index')),
          //     );
          //   }
          // ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,//content?.length,
            itemBuilder: (BuildContext context, int index) {
              String productName = content?[index]['title'];
              String price = content?[index]['price'];
              String imagePath = content?[index]['imagePath'];

              return ProductDetailCard(
                title: productName,
                price: price,
                imagePath: imagePath,
              );
            }
          ),

          // const ProductDetailCard(
          //   title: 'Капуста',
          //   price: '80',
          //   imagePath: 'assets/images/categories/greenShit.jpg',
          // ),
          // const SizedBox(height: 24,),
          // const ProductDetailCard(
          //   title: 'Помидоры',
          //   price: '240',
          //   imagePath: 'assets/images/categories/greenShit.jpg',
          // ),
          // const SizedBox(height: 24,),
          // const ProductDetailCard(
          //   title: 'Огруцы',
          //   price: '110',
          //   imagePath: 'assets/images/categories/greenShit.jpg',
          // ),
          // const SizedBox(height: 24,),
          // const ProductDetailCard(
          //   title: 'Кукуруза',
          //   price: '165',
          //   imagePath: 'assets/images/categories/greenShit.jpg',
          // ),
          const SizedBox(height: 10,),

        ]),
      ),

    );
  }
}



class ProductDetailCard extends StatefulWidget {
  const ProductDetailCard({
    super.key,
    this.title='', 
    this.price='',
    this.imagePath='assets/images/categories/greenShit.jpg',
    this.pageRoute='/home'
    });

    final String title;
    final String price;
    final String imagePath;
    final String pageRoute;

  @override
  State<ProductDetailCard> createState() => _ProductDetailCardState();
}

class _ProductDetailCardState extends State<ProductDetailCard> {
  var activeHeart = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 128,
          child: Row(
            children: [
              SizedBox(
                height: 128,
                width: MediaQuery.of(context).size.width*0.4,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(widget.imagePath, fit: BoxFit.cover,),
                  ),
              ),
              const SizedBox(width: 22,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  Text(widget.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                  const SizedBox(height: 10,),
                  RichText(
                    text: TextSpan(
                          text: widget.price,
                          style: const TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w700),
                          children: const <TextSpan>[
                            TextSpan(
                              text: ' ₽',
                              style: TextStyle(
                                fontSize: 16,
                                // fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: ' / kg',
                              style: TextStyle(
                                fontSize: 16,
                                // fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                                color: AppColors.color9586A8
                              ),
                            ),
                          ]
                    ),
                ),
                const Expanded(child: SizedBox()),

                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.color9586A8),
                        color: activeHeart ? AppColors.colorF05E30 : Colors.white,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){
                            if (activeHeart) {
                              setState(() {
                                activeHeart = false;
                                print(activeHeart);
                              });
                            }
                            else {
                              setState(() {
                                activeHeart = true;
                                print(activeHeart);
                              });
                            }
                          },
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset(A.assetsHeart, scale: 2, color: activeHeart ? Colors.white : AppColors.color9586A8,),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.color0BCE83,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: (){},
                          child: SizedBox(
                            height: 40,
                            width: 80,
                            
                            child: Image.asset(A.assetsShopCart, color: AppColors.colorF6F5F5,),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
              )
            ],
          ),
        ),
        const SizedBox(height: 24,),
      ],
    );
  }
}