import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'splashScreen_page.dart'; // Import file splash screen Anda
import 'login_page.dart';        // Import file login Anda

void main() async {
  // Pastikan binding Flutter diinisialisasi sebelum Supabase
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Supabase
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
      
      // Mengatur tema global aplikasi
      theme: ThemeData(
        useMaterial3: true, 
        colorSchemeSeed: const Color(0xFF2563EB), // Warna biru tema utama
      ),

      // Halaman pertama yang muncul adalah Splash Screen
      home: const SplashScreenPage(),
    );
  }
}