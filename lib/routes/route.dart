import 'package:flutter_app_structure/animation/size_transition.dart';
import 'package:flutter_app_structure/models/Todo.dart';
import 'package:flutter_app_structure/models/simple_bind.dart';
import 'package:flutter_app_structure/screens/TodoScreen.dart';
import 'package:flutter_app_structure/screens/screens.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  //Simple GetPage
  GetPage(name: '/', page: () => NavScreen()),
  GetPage(name: '/home', page: () => First()),
  // GetPage with custom transitions and bindings
  GetPage(
    name: '/second',
    page: () => Second(),
    customTransition: SizeTransitions(),
    binding: SampleBind(),
  ),
  // GetPage with default transitions
  GetPage(
    name: '/third',
    transition: Transition.cupertino,
    page: () => Third(),
  ),
  GetPage(
    name: '/profile',
    transition: Transition.cupertino,
    page: () => Profile(),
  ),
  GetPage(
    name: '/todo',
    transition: Transition.cupertino,
    page: () => TodoScreen(index: 1),
  ),
];
