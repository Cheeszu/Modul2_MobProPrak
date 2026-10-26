import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alignment',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Alignment'),
        ),
        // Pilih salah satu pengujian tampilan di bawah ini dengan menghilangkan komentar:

        // Langkah 4: Row sederhana
        // body: const TampilanRowSederhana(),

        // Langkah 5 & 6: Row dengan MainAxisSize (max / min)
        // body: const TampilanRowMainAxisSize(),

        // Langkah 8 & 9: Alignment pada Row
        // body: const TampilanRowAlignment(),

        // Langkah 9e & 9f: Pengujian Baseline
        body: const TampilanBaseline(),
      ),
    );
  }
}

// Langkah 2: Widget Custom KotakBiruJempol
class KotakBiruJempol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.thumb_up,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}

// Langkah 3: Widget Custom KotakBiruJempolKecil
class KotakBiruJempolKecil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.thumb_up,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}

// Langkah 4: Tampilan Row Sederhana
class TampilanRowSederhana extends StatelessWidget {
  const TampilanRowSederhana({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          KotakBiruJempolKecil(),
          const SizedBox(width: 20),
          KotakBiruJempol(),
          const SizedBox(width: 20),
          KotakBiruJempolKecil(),
        ],
      ),
    );
  }
}

// Langkah 5 & 6: Pengujian MainAxisSize
class TampilanRowMainAxisSize extends StatelessWidget {
  const TampilanRowMainAxisSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        // Ubah ke MainAxisSize.max atau MainAxisSize.min
        mainAxisSize: MainAxisSize.min,
        children: [
          KotakBiruJempolKecil(),
          const SizedBox(width: 20),
          KotakBiruJempol(),
          const SizedBox(width: 20),
          KotakBiruJempolKecil(),
        ],
      ),
    );
  }
}

// Langkah 8 & 9: Pengujian MainAxisAlignment & CrossAxisAlignment
class TampilanRowAlignment extends StatelessWidget {
  const TampilanRowAlignment({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        // Variasi MainAxisAlignment: start, end, center, spaceBetween, spaceAround, spaceEvenly
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // Variasi CrossAxisAlignment: start, end, center, stretch
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          KotakBiruJempolKecil(),
          KotakBiruJempol(),
          KotakBiruJempolKecil(),
        ],
      ),
    );
  }
}

// Langkah 9e & 9f: Pengujian CrossAxisAlignment.baseline
class TampilanBaseline extends StatelessWidget {
  const TampilanBaseline({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            'Suhu:',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            '25°C',
            style: TextStyle(fontSize: 75),
          ),
          Icon(
            Icons.sunny,
            color: Colors.amber,
            size: 45,
          ),
        ],
      ),
    );
  }
}