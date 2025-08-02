// login_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

// Simulasi fungsi Google Sign In (ganti nanti pake Firebase Auth beneran)
Future<bool> simulateGoogleSignIn() async {
  await Future.delayed(const Duration(seconds: 2));
  return true; // anggap berhasil login google
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isGoogleSigningIn = false;
  bool _googleSignedIn = false;

  final TextEditingController _usernameController = TextEditingController();

  void _startGoogleSignIn() async {
    setState(() {
      _isGoogleSigningIn = true;
    });
    bool success = await simulateGoogleSignIn();

    if (success) {
      setState(() {
        _googleSignedIn = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal login Google')),
      );
    }
    setState(() {
      _isGoogleSigningIn = false;
    });
  }

  void _submitUsername() {
    if (_usernameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan username dulu')),
      );
      return;
    }
    // Lanjut ke home, kirim username
    Navigator.pushReplacementNamed(context, '/home', arguments: _usernameController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: _isGoogleSigningIn
              ? const CircularProgressIndicator(color: Colors.white)
              : !_googleSignedIn
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Welcome to Rezid',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Top-up game zaman sekarang',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40),
                        SignInButton(
                          Buttons.Google,
                          onPressed: _startGoogleSignIn,
                        ),
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Masukkan Username',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _usernameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Username kamu',
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: const Color(0xFF1A1A1A),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: _submitUsername,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            minimumSize: const Size.fromHeight(48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Lanjut',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}