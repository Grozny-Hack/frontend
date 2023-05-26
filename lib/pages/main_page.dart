import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../utils/app_colors.dart';
import '../utils/app_routes.dart';
import '../utils/assets.dart';

class MainPage extends StatefulWidget {
  final Widget child;
  final String location;

  MainPage({required this.child, required this.location, super.key});

  static const double navBarHeight = 60.0;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int get _currentIndex => MenuRoute.values
      .firstWhere((e) => widget.location.contains(e.path))
      .index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: widget.child,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  void _onItemTapped(BuildContext context, MenuRoute menuRoute) {
    if (menuRoute.index != _currentIndex) {
      context.go(menuRoute.path);
    }
  }

  final double _iconsSize = 20.0;

  Widget _buildBottomNavigationBar() {
    return SafeArea(
      child: SizedBox(
        height: MainPage.navBarHeight,
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            elevation: 0.0,
            selectedItemColor: AppColors.color7203FF,
            unselectedItemColor: AppColors.color9586A8,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: SizedBox(
                    width: _iconsSize,
                    height: _iconsSize,
                    child: Icon(Icons.home_outlined),
                  ),
                ),
                label: 'Главная',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: SizedBox(
                    width: _iconsSize,
                    height: _iconsSize,
                    child: Image.asset(
                      A.assetsNavBarCategoryIcon,
                      color: AppColors.color9586A8,
                    ),
                  ),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: SizedBox(
                    width: _iconsSize,
                    height: _iconsSize,
                    child: Image.asset(
                      A.assetsNavBarCategoryIcon,
                      color: AppColors.color7203FF,
                    ),
                  ),
                ),
                label: 'Категории',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: SizedBox(
                    width: _iconsSize,
                    height: _iconsSize,
                    child: Image.asset(A.assetsNavBarBasketIcon),
                  ),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: SizedBox(
                    width: _iconsSize,
                    height: _iconsSize,
                    child: Image.asset(
                      A.assetsNavBarBasketIcon,
                      color: AppColors.color7203FF,
                    ),
                  ),
                ),
                label: 'Корзина',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: SizedBox(
                    width: _iconsSize,
                    height: _iconsSize,
                    child: Image.asset(A.assetsNavBarProfileIcon),
                  ),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: SizedBox(
                    width: _iconsSize,
                    height: _iconsSize,
                    child: Image.asset(
                      A.assetsNavBarProfileIcon,
                      color: AppColors.color7203FF,
                    ),
                  ),
                ),
                label: 'Профиль',
              ),
            ],
            onTap: (index) => _onItemTapped(context, MenuRoute.values[index]),
            currentIndex: _currentIndex,
          ),
        ),
      ),
    );
  }
}
