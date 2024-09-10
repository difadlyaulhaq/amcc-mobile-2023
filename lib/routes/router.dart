import 'package:go_router/go_router.dart';
import 'package:intermediate_project/pages/NotesHomePage.dart';
import 'package:intermediate_project/pages/signup.dart';
import '../pages/splash.dart';
import '../pages/login.dart';
part 'route_name.dart';

final router = GoRouter(
  routes:[
    GoRoute(
      path: '/',
      name: Routnames.splash,
      builder: (context, state) => const Splashscreen(),
    ),
    GoRoute(
      path: '/Login',
      name: Routnames.login,
      builder: (context, state) => const LoginPage(),   
    ),
    GoRoute(
      path:'/signup',
      name: Routnames.signup,
      builder: (context, state) => const SignupPage(), 
      ),
    GoRoute(
      path: '/home',
      name: Routnames.home,
      builder: (context, state) => const NotesHomePage(),
    )
  ]
);