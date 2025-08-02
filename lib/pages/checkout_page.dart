import 'package:flutter/material.dart';
import '../models/game.dart';

class CheckoutPage extends StatelessWidget {
  final Game game;
  final String playerId;
  final String nominal;

  const CheckoutPage({
    super.key,
    required this.game,
    required this.playerId,
    required this.nominal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pembayaran Top Up',
              style: TextStyle(fontSize: 24, color: Colors.deepPurple.shade300, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 24),
            Text('Game: ${game.name}', style: const TextStyle(color: Colors.white70, fontSize: 18)),
            const SizedBox(height: 8),
            Text('Player ID: $playerId', style: const TextStyle(color: Colors.white70, fontSize: 18)),
            const SizedBox(height: 8),
            Text('Nominal: $nominal', style: const TextStyle(color: Colors.white70, fontSize: 18)),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Misal submit pembayaran di sini
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pembayaran berhasil!')),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  child: Text('Bayar Sekarang'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}