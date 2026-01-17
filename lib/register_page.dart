import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> handleRegister() async {
    setState(() => isLoading = false);

    try {
      await Supabase.instance.client.auth.signUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        data: {'full_name': nameController.text.trim()},
      );

      if (mounted) {
        // Beri tahu pengguna pendaftaran berhasil
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Daftar berhasil"), backgroundColor: Colors.green),
        );
        
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Gagal: ${e.toString()}"), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buat Akun")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            
            
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Nama Lengkap",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Kata Sandi",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isLoading ? null : handleRegister,
                child: isLoading 
                    ? const CircularProgressIndicator() 
                    : const Text("DAFTAR SEKARANG"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}