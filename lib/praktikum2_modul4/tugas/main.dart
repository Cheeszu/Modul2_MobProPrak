import 'package:flutter/material.dart';

void main() {
  runApp(const PemutarMusikApp());
}

class PemutarMusikApp extends StatelessWidget {
  const PemutarMusikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pemutar Musik',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: const Center(
          child: Text(
            'Pemutar Musik',
            style: TextStyle(fontSize: 22),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.black54,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            children: [
              // 1. Shuffle
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.shuffle, color: Colors.white),
                  onPressed: () {},
                ),
              ),
              // 2. Previous
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.skip_previous, color: Colors.white),
                  onPressed: () {},
                ),
              ),
              // 3. Play (Ukuran lebih besar menggunakan Flexible dengan flex: 2 & tight)
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: IconButton(
                  iconSize: 50,
                  icon: const Icon(Icons.play_circle_fill, color: Colors.white),
                  onPressed: () {},
                ),
              ),
              // 4. Next
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.skip_next, color: Colors.white),
                  onPressed: () {},
                ),
              ),
              // 5. Repeat
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.repeat, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}