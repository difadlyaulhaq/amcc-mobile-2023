import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intermediate_project/bloc/auth/auth_bloc.dart';
import 'package:intermediate_project/firebase_options.dart';
import 'package:intermediate_project/routes/router.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(),)
      ],
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}
