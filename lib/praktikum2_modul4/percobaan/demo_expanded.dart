import 'package:flutter/material.dart';

void main() {
  runApp(const DemoExpandedApp());
}

class DemoExpandedApp extends StatelessWidget {
  const DemoExpandedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expanded',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expanded'),
        ),
        // Silakan ganti child sesuai tahap percobaan 2.e, 2.f, 2.g, atau 2.h
        body: const ExpandedTahapH(),
      ),
    );
  }
}

Container _kotakUji(Color warna, double tinggi, String teks) {
  return Container(
    width: double.infinity,
    height: tinggi,
    color: warna,
    alignment: const Alignment(0.0, 0.0),
    child: Text(
      teks,
      style: const TextStyle(fontSize: 30, color: Colors.white),
    ),
  );
}

// Percobaan 2.e: Tanpa Flexible / Expanded
class ExpandedTahapE extends StatelessWidget {
  const ExpandedTahapE({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _kotakUji(Colors.amber, 150, 'Normal'),
        _kotakUji(Colors.green, 100, 'Flexible'),
        _kotakUji(Colors.blue, 250, 'Expanded'),
      ],
    );
  }
}

// Percobaan 2.f: Flexible (tight, flex 1) dan Expanded (flex 1)
class ExpandedTahapF extends StatelessWidget {
  const ExpandedTahapF({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _kotakUji(Colors.amber, 150, 'Normal'),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: _kotakUji(Colors.green, 100, 'Flexible'),
        ),
        Expanded(
          flex: 1,
          child: _kotakUji(Colors.blue, 250, 'Expanded'),
        ),
      ],
    );
  }
}

// Percobaan 2.g: Flexible (tight, flex 1) dan Expanded (flex 2)
class ExpandedTahapG extends StatelessWidget {
  const ExpandedTahapG({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _kotakUji(Colors.amber, 150, 'Normal'),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: _kotakUji(Colors.green, 100, 'Flexible'),
        ),
        Expanded(
          flex: 2,
          child: _kotakUji(Colors.blue, 250, 'Expanded'),
        ),
      ],
    );
  }
}

// Percobaan 2.h: Flexible (loose, flex 1) dan Expanded (flex 2)
class ExpandedTahapH extends StatelessWidget {
  const ExpandedTahapH({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _kotakUji(Colors.amber, 150, 'Normal'),
        Flexible(
          fit: FlexFit.loose,
          flex: 1,
          child: _kotakUji(Colors.green, 100, 'Flexible'),
        ),
        Expanded(
          flex: 2,
          child: _kotakUji(Colors.blue, 250, 'Expanded'),
        ),
      ],
    );
  }
}