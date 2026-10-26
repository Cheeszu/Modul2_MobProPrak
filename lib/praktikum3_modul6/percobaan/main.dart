import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo Modul 06',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const ScaffoldPage(),
    );
  }
}

class ScaffoldPage extends StatefulWidget {
  const ScaffoldPage({super.key});

  @override
  State<ScaffoldPage> createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> {
  List dataBerita = [];

  @override
  void initState() {
    super.initState();
    _ambilData();
  }

  // Request Data dari API untuk Percobaan 3 & 4
  Future _ambilData() async {
    try {
      final response = await http.get(
        Uri.parse('https://jakpost.vercel.app/api/category/business/tech'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          dataBerita = data['posts'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Modul 06'),
        backgroundColor: Colors.amber,
      ),
      // Aktifkan salah satu tampilan percobaan di bawah ini:

      // Percobaan 1: GridView
      // body: _buildGridView(),

      // Percobaan 2: ListView
      // body: _buildListView(),

      // Percobaan 3: GridView.builder
      // body: _buildGridViewBuilder(),

      // Percobaan 4: ListView.builder
      body: _buildListViewBuilder(),
    );
  }

  // --- PERCOBAAN 1: GridView ---
  Widget _buildGridView() {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: [
        tile(Colors.greenAccent.shade400, 'assets/icon/timetable.png', 'Jadwal Kuliah'),
        tile(Colors.blueAccent.shade400, 'assets/icon/boy.png', 'Kehadiran'),
        tile(Colors.yellowAccent.shade400, 'assets/icon/homeschooling.png', 'Tugas'),
        tile(Colors.redAccent.shade400, 'assets/icon/clipboard.png', 'Pengumuman'),
        tile(Colors.purpleAccent.shade400, 'assets/icon/marks.png', 'Nilai'),
        tile(Colors.tealAccent.shade400, 'assets/icon/pencil.png', 'Catatan'),
      ],
    );
  }

  ClipRRect tile(Color warnakotak, String gambar, String judul) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: warnakotak,
        child: GridTile(
          footer: SizedBox(
            height: 45,
            child: GridTileBar(
              backgroundColor: Colors.black38,
              title: Text(
                judul,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          child: Image.asset(gambar, scale: 4),
        ),
      ),
    );
  }

  // --- PERCOBAAN 2: ListView ---
  Widget _buildListView() {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        listTile(Colors.blueAccent.shade400, Colors.greenAccent.shade400, 'Kehadiran', 'Presensi kehadiran kuliah', 'assets/icon/boy.png'),
        listTile(Colors.greenAccent.shade400, Colors.blueAccent.shade400, 'Jadwal', 'Jadwal perkuliahan', 'assets/icon/timetable.png'),
        listTile(Colors.yellowAccent.shade400, Colors.redAccent.shade400, 'Tugas', 'Tugas perkuliahan di luar kelas', 'assets/icon/homeschooling.png'),
        listTile(Colors.redAccent.shade400, Colors.amberAccent.shade400, 'Pengumuman', 'Informasi terkait perkuliahan', 'assets/icon/clipboard.png'),
        listTile(Colors.purpleAccent.shade400, Colors.tealAccent.shade400, 'Nilai', 'Nilai ujian dan tugas', 'assets/icon/marks.png'),
        listTile(Colors.tealAccent.shade400, Colors.purpleAccent.shade400, 'Catatan', 'Pengingat kegiatan perkuliahan', 'assets/icon/pencil.png'),
      ],
    );
  }

  Container listTile(Color warna, Color warnaAvatar, String judul, String subjudul, String gambar) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        tileColor: warna,
        title: Text(
          judul,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subjudul,
          style: const TextStyle(fontSize: 16),
        ),
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: warnaAvatar,
          child: Image.asset(gambar, width: 35, height: 35),
        ),
        trailing: Icon(
          Icons.star,
          color: Colors.orangeAccent.shade400,
        ),
      ),
    );
  }

  // --- PERCOBAAN 3: GridView.builder ---
  Widget _buildGridViewBuilder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.25,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: dataBerita.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: GridTile(
              footer: SizedBox(
                height: 65,
                child: GridTileBar(
                  backgroundColor: Colors.black26.withAlpha(175),
                  title: Text(
                    dataBerita[index]['title'] ?? 'Tanpa judul',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              child: Image(
                image: NetworkImage(
                  dataBerita[index]['image'] ?? 'https://via.placeholder.com/150',
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  // --- PERCOBAAN 4: ListView.builder ---
  Widget _buildListViewBuilder() {
    return ListView.builder(
      itemCount: dataBerita.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).colorScheme.inversePrimary,
                width: 1,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              title: Text(
                dataBerita[index]['title'] ?? 'Tidak ada judul',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                dataBerita[index]['published_at'] ?? 'Tidak ada data',
                maxLines: 1,
                style: const TextStyle(fontSize: 16),
              ),
              leading: Image.network(
                dataBerita[index]['image'] ?? 'https://via.placeholder.com/150',
                fit: BoxFit.cover,
                width: 100,
              ),
            ),
          ),
        );
      },
    );
  }
}