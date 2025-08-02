import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/game.dart';

class TopUpPage extends StatefulWidget {
  final Game game;
  const TopUpPage({super.key, required this.game});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  final TextEditingController _playerIdController = TextEditingController();
  String? selectedNominal;

  final List<String> nominals = [
    '86 Diamond',
    '172 Diamond',
    '257 Diamond',
    '344 Diamond',
    '429 Diamond',
    '514 Diamond',
  ];

  @override
  void dispose() {
    _playerIdController.dispose();
    super.dispose();
  }

  void _goToCheckout() {
    if (selectedNominal != null && _playerIdController.text.isNotEmpty) {
      context.go(
        '/checkout',
        extra: {
          'game': widget.game,
          'playerId': _playerIdController.text,
          'nominal': selectedNominal,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Top Up ${widget.game.name}',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Hero(
            tag: widget.game.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(widget.game.image, height: 120),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Player ID',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _playerIdController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Masukkan ID pemain',
              hintStyle: const TextStyle(color: Colors.white30),
              filled: true,
              fillColor: Colors.grey[900],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Pilih Nominal Diamond',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: nominals.map((nominal) {
              final isSelected = nominal == selectedNominal;
              return ChoiceChip(
                label: Text(
                  nominal,
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                selected: isSelected,
                selectedColor: Colors.deepPurple.shade400,
                backgroundColor: Colors.grey[900],
                onSelected: (_) {
                  setState(() {
                    selectedNominal = nominal;
                  });
                },
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              );
            }).toList(),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: selectedNominal != null && _playerIdController.text.isNotEmpty
                ? _goToCheckout
                : null,
            child: const Text(
              'Lanjut ke Pembayaran',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}