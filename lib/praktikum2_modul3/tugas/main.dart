import 'package:flutter/material.dart';

void main() {
  runApp(const MyAppCuaca());
}

class MyAppCuaca extends StatelessWidget {
  const MyAppCuaca({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cuaca Malang',
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Nama Kota
                const Text(
                  'Malang',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
                ),
                // Suhu Utama
                const Text(
                  '25°',
                  style: TextStyle(fontSize: 90, fontWeight: FontWeight.w300),
                ),
                // Prediksi Tiga Hari (Minggu, Senin, Selasa)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    ItemCuaca(
                      hari: 'Minggu',
                      iconData: Icons.sunny,
                      suhu: '20°C',
                    ),
                    ItemCuaca(
                      hari: 'Senin',
                      iconData: Icons.cloudy_snowing,
                      suhu: '23°C',
                    ),
                    ItemCuaca(
                      hari: 'Selasa',
                      iconData: Icons.cloud,
                      suhu: '22°C',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget Reusable untuk Kolom Cuaca Per Hari
class ItemCuaca extends StatelessWidget {
  final String hari;
  final IconData iconData;
  final String suhu;

  const ItemCuaca({
    super.key,
    required this.hari,
    required this.iconData,
    required this.suhu,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          hari,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Icon(
          iconData,
          size: 35,
          color: Colors.black,
        ),
        const SizedBox(height: 10),
        Text(
          suhu,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}