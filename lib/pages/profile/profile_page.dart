import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Профиль',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.color0BCE83,
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.white,
                      ),
                      radius: 50.0,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '@$username',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: AppColors.nunito,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Катерина Баюк',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: AppColors.nunito,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Катерина Баюк',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: AppColors.nunito,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: InkWell(
                        onTap: () {
                          context.read<ProfileBloc>().add(ProfileLogoutEvent());
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.logout),
                                SizedBox(
                                  width: 20,
                                ),
                                Text('Log out'),
                                Spacer(),
                                Icon(Icons.chevron_right_rounded)
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
