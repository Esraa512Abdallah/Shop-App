import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/data_layer/api/user_api/login_api.dart';
import 'package:shop_app/data_layer/repository/login_repository.dart';
import 'package:shop_app/presentation_layer/screens/onbording_screen.dart';

import '../../bussiness_logic_layer/login_cubit.dart';

class AppRouter {
  late LoginRepository loginRepository;

  late LoginCubit loginCubit;

  AppRouter() {
    loginRepository = LoginRepository(loginApi: LoginApi());
    loginCubit = LoginCubit(loginRepository: loginRepository);
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case '/login_screen':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => LoginCubit(
              loginRepository: loginRepository,
            ),
            child: OnBoardingScreen(),
          ),
        );
      case '/characters_details_screen':
      // return MaterialPageRoute(builder: (_) => CharactersDetailsScreen());
    }

    return null;
  }
}
