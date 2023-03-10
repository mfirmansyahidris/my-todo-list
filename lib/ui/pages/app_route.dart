import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ui.dart';


class AppRoute {
  AppRoute._();

  //define page route name
  static const String splashPage = "splash";
  static const String todoPage = "todo";

  //define page route
  static Map<String, WidgetBuilder> getRoutes({RouteSettings? settings}) => {
    splashPage: (_) => BlocProvider(create: (context) => SplashBloc(), child: const SplashView()),
    todoPage: (_) {
      return const TodoView();
    },
  };
}
