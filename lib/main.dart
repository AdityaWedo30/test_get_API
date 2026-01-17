import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'splashScreen_page.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://zdjuzuqvbkawxbghgbda.supabase.co', 
    anonKey: 'sb_publishable_zd6bkY6238hUpCkhlG1Xsw_gLv7pLqT',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      title: 'Project Test',
      
      theme: ThemeData(
        useMaterial3: true, 
        colorSchemeSeed: const Color(0xFF2563EB), 
      ),

      home: const SplashScreenPage(),
    );
  }
}