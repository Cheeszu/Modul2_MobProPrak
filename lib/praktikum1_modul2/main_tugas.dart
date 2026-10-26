import 'package:flutter/material.dart';

void main() {
  runApp(const MyAppTugas());
}

class MyAppTugas extends StatelessWidget {
  const MyAppTugas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Row and Column',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tugas Row and Column'),
          backgroundColor: Colors.blue,
        ),
        body: const Center(
          child: GridTugas(),
        ),
      ),
    );
  }
}

// Widget Custom Kotak dengan Warna, Icon Favorite Merah, dan Teks
class KotakWarnaCustom extends StatelessWidget {
  final Color warnaKotak;
  final String labelTeks;

  const KotakWarnaCustom({
    super.key,
    required this.warnaKotak,
    required this.labelTeks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: warnaKotak,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 40,
          ),
          const SizedBox(height: 5),
          Text(
            labelTeks,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// Gabungan Row dan Column untuk membuat Grid 2x2 dengan 4 Warna Berbeda
class GridTugas extends StatelessWidget {
  const GridTugas({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Baris Pertama
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            KotakWarnaCustom(
              warnaKotak: Colors.blue,
              labelTeks: 'Kotak 1',
            ),
            SizedBox(width: 15),
            KotakWarnaCustom(
              warnaKotak: Colors.green,
              labelTeks: 'Kotak 2',
            ),
          ],
        ),
        const SizedBox(height: 15),
        // Baris Kedua
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            KotakWarnaCustom(
              warnaKotak: Colors.orange,
              labelTeks: 'Kotak 3',
            ),
            SizedBox(width: 15),
            KotakWarnaCustom(
              warnaKotak: Colors.purple,
              labelTeks: 'Kotak 4',
            ),
          ],
        ),
      ],
    );
  }
}