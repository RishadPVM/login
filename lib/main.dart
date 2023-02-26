import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/cubit/cubit_cubit.dart';
import 'package:flutter_application_1/cubit/cubit/cubit_cubit.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
        return BlocProvider(
          create: (context) => CubitCubit(),
          child: MaterialApp(
            home: LoginPage(),
            // home: Register(),
          ),
        );
    
  }
}
