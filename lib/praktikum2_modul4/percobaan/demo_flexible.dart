import 'package:flutter/material.dart';

void main() {
  runApp(const DemoFlexibleApp());
}

class DemoFlexibleApp extends StatelessWidget {
  const DemoFlexibleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flexible',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flexible'),
        ),
        // Untuk menguji berbagai variasi Flexible:
        // 1. FlexLooseOnly (Percobaan 1.e)
        // 2. FlexTightOnly (Percobaan 1.g)
        // 3. FlexKombinasi (Percobaan 1.i)
        body: const Center(
          child: FlexKombinasi(),
        ),
      ),
    );
  }
}

class KotakBiruJempolKecil extends StatelessWidget {
  const KotakBiruJempolKecil({super.key});

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

// Variasi 1: Flex tanpa menentukan fit (Default FlexFit.loose)
class FlexLooseOnly extends StatelessWidget {
  const FlexLooseOnly({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Flexible(flex: 1, child: KotakBiruJempolKecil()),
        Flexible(flex: 3, child: KotakBiruJempolKecil()),
        Flexible(flex: 2, child: KotakBiruJempolKecil()),
      ],
    );
  }
}

// Variasi 2: Flex dengan FlexFit.tight
class FlexTightOnly extends StatelessWidget {
  const FlexTightOnly({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Flexible(fit: FlexFit.tight, flex: 1, child: KotakBiruJempolKecil()),
        Flexible(fit: FlexFit.tight, flex: 3, child: KotakBiruJempolKecil()),
        Flexible(fit: FlexFit.tight, flex: 2, child: KotakBiruJempolKecil()),
      ],
    );
  }
}

// Variasi 3: Kombinasi FlexFit.tight dan FlexFit.loose
class FlexKombinasi extends StatelessWidget {
  const FlexKombinasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Flexible(fit: FlexFit.tight, flex: 1, child: KotakBiruJempolKecil()),
        Flexible(fit: FlexFit.tight, flex: 3, child: KotakBiruJempolKecil()),
        Flexible(fit: FlexFit.loose, flex: 2, child: KotakBiruJempolKecil()),
      ],
    );
  }
}