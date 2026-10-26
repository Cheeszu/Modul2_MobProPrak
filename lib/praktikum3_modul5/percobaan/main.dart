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
      title: 'Demo Modul 05',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Demo SizedBox, Spacer & Card'),
        ),
        // Aktifkan salah satu tampilan di bawah untuk mencoba tiap percobaan:

        // Percobaan 1: SizedBox
        // body: const TampilanSizedBox(),

        // Percobaan 2: Spacer
        // body: const TampilanSpacer(),

        // Percobaan 3: Card
        body: const TampilanCard(),
      ),
    );
  }
}

// Method pembuat kotak warna uji
Container kotakUji(Color warna) {
  return Container(
    height: 75,
    width: 75,
    color: warna,
  );
}

// Percobaan 1 - SizedBox
class TampilanSizedBox extends StatelessWidget {
  const TampilanSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          kotakUji(Colors.amber),
          const SizedBox(width: 25, height: 25),
          SizedBox(
            width: 100,
            height: 100,
            child: kotakUji(Colors.green),
          ),
          const SizedBox(width: 25, height: 25),
          kotakUji(Colors.blue),
        ],
      ),
    );
  }
}

// Percobaan 2 - Spacer
class TampilanSpacer extends StatelessWidget {
  const TampilanSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          kotakUji(Colors.amber),
          const Spacer(flex: 1),
          SizedBox(
            width: 100,
            height: 100,
            child: kotakUji(Colors.green),
          ),
          const Spacer(flex: 2),
          kotakUji(Colors.blue),
        ],
      ),
    );
  }
}

// Percobaan 3 - Card
class TampilanCard extends StatelessWidget {
  const TampilanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              leading: Icon(
                Icons.location_pin,
                color: Colors.red,
              ),
              title: Text(
                'Taman Nasional Bromo Tengger Semeru',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Jawa Timur, Indonesia'),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                    ),
                    child: const Icon(Icons.map),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                    ),
                    child: const Icon(Icons.phone),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}