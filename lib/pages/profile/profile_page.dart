import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:go_router/go_router.dart';

import '../../service/api_requests.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_routes.dart';
import 'bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final authService = Injector().get<AuthService>();
  final String username = 'Admin';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(authService: authService),
      child: Scaffold(
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileLogoutState) {
              context.go(Routes.signInPage);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: (){},
                            child: const Icon(
                              Icons.edit,
                              size: 30,
                              color: AppColors.color7e56e8,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // CircleAvatar(
                      //   backgroundColor: Colors.amber,
                      //   child: Icon(Icons.person,
                      //       size: 30, color: AppColors.color7e56e8),
                      //   radius: 150.0,
                      // ),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        child: Image.asset(
                          'assets/images/profilepage.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Катерина Баюк',
                              style:
                                  TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '@$username',
                              style:
                                  const TextStyle(fontSize: 18, fontFamily: AppColors.nunito, color: Colors.grey),
                            ),
                          ]),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              const Text(
                                  'Данные карты',
                                  style:
                                      TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                                ),
                                InkWell(
                                  onTap: (){},
                                  child: const Text(
                                    'ИЗМЕНИТЬ',
                                    style:
                                        TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.color0BCE83),
                                  ),
                                ),
                                
                            ],),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Image.asset('assets/icons/credit-card.png', height: 24,),
                                const SizedBox(
                                  width: 25,
                                ),
                                const Text('**** **** **** 4747', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: AppColors.color9586A8),)
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
              
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              const Text(
                                  'Адрес доставки',
                                  style:
                                      TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                                ),
                                InkWell(
                                  onTap: (){},
                                  child: const Text(
                                    'ИЗМЕНИТЬ',
                                    style:
                                        TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.color0BCE83),
                                  ),
                                ),    
                            ],),
                            const SizedBox(
                              height: 20,
                            ),
              
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/icons/home.png', height: 24,),
                                const SizedBox(
                                  width: 25,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('Alexadra Smith', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: AppColors.color9586A8)),
                                    Text('Cesu 31 k-2 5.st, SIA Chili', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: AppColors.color9586A8)),
                                    Text('Riga', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: AppColors.color9586A8)),
                                    Text('LV–1012', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: AppColors.color9586A8)),
                                    Text('Latvia', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: AppColors.color9586A8)),
              
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        ),
              
                      const SizedBox(
                        height: 40,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          context.read<ProfileBloc>().add(ProfileLogoutEvent());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            // Icon(Icons.logout),
                            
                            Text('Выйти из акаунта', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.colorF05E30),),
                            // Spacer(),
                            // Icon(Icons.chevron_right_rounded)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
