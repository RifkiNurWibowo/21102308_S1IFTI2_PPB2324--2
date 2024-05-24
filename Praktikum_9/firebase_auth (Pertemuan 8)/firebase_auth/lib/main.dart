import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application/bloc/login/login_cubit.dart'; 
import 'package:flutter_application/ui/splash.dart'; 
import 'package:flutter_application/utils/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'firebase_options.dart'; 

void main() async { 
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp( 
    options: DefaultFirebaseOptions.currentPlatform, 
  ); 
  runApp(const MyApp()); 
} 

class MyApp extends StatelessWidget { 
  const MyApp({super.key}); 
  
  @override 
  Widget build(BuildContext context) { 
    return MultiBlocProvider( 
      providers: [ 
        BlocProvider(create: (context) => LoginCubit()) 
    ], 
    child: MaterialApp( 
      title: "Praktikum 6", 
      debugShowCheckedModeBanner: false, 
      navigatorKey: NAV_KEY, 
      onGenerateRoute: generateRoute, 
      home: const SplashScreen(), 
      ),
    ); 
  } 
}