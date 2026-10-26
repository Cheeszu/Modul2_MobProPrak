import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Row and Column',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Row and Column'),
          backgroundColor: Colors.blue,
        ),
        // Ubah menjadi TampilanRow() atau TampilanColumn() sesuai langkah kerja
        body: const Center(
          child: TampilanColumn(),
        ),
      ),
    );
  }
}

// Langkah 2 & 3: Custom Widget awal (Kotak Biru dengan Icon Jempol)
class KotakBiruJempol extends StatelessWidget {
  const KotakBiruJempol({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        Icons.thumb_up,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}

// Langkah 4: Menampilkan beberapa widget dengan Row
class TampilanRow extends StatelessWidget {
  const TampilanRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        KotakBiruJempol(),
        SizedBox(width: 10),
        KotakBiruJempol(),
        SizedBox(width: 10),
        KotakBiruJempol(),
      ],
    );
  }
}

// Langkah 5: Mengatur tata letak vertikal dengan Column
class TampilanColumn extends StatelessWidget {
  const TampilanColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        KotakBiruJempol(),
        SizedBox(height: 10),
        KotakBiruJempol(),
        SizedBox(height: 10),
        KotakBiruJempol(),
      ],
    );
  }
}