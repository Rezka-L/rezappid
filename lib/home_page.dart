import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, this.username = 'Guest'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $username!'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Logout & balik ke login
              context.go('/login');
            },
            tooltip: 'Logout',
          ),
        ],
      ),
      backgroundColor: const Color(0xFF101010),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Available Games for Top-Up',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            // Contoh list game
            _gameCard('Mobile Legends', Icons.gamepad),
            _gameCard('Free Fire', Icons.local_fire_department),
            _gameCard('PUBG Mobile', Icons.sports_esports),
            // Tambah sesuai kebutuhan
          ],
        ),
      ),
    );
  }

  Widget _gameCard(String title, IconData icon) {
    return Card(
      color: const Color(0xFF1A1A1A),
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
        onTap: () {
          // Bisa ditambahkan navigasi ke halaman detail/top up
        },
      ),
    );
  }
}