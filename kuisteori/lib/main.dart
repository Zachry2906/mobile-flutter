import 'package:flutter/material.dart';
import 'dart:math' as Math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    JajarGenjangPage(),
    LimasPage(),
    HariPage(),
    DataDiriPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.change_history),
            label: "Jajar Genjang",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: "Limas"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Hari",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Data Diri"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

// Halaman Jajar Genjang (Formerly Trapesium)
class JajarGenjangPage extends StatefulWidget {
  @override
  _JajarGenjangPageState createState() => _JajarGenjangPageState();
}

class _JajarGenjangPageState extends State<JajarGenjangPage> {
  final TextEditingController alas = TextEditingController();
  final TextEditingController tinggi = TextEditingController();
  final TextEditingController sisiMiring = TextEditingController();
  double luas = 0, keliling = 0;

  void hitung() {
    double a = double.tryParse(alas.text) ?? 0;
    double t = double.tryParse(tinggi.text) ?? 0;
    double b = double.tryParse(sisiMiring.text) ?? 0;
    setState(() {
      luas = a * t;
      keliling = 2 * (a + b);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hitung Jajar Genjang")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: alas,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Alas",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: tinggi,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Tinggi",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: sisiMiring,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Sisi Miring",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(onPressed: hitung, child: Text("Hitung")),
            SizedBox(height: 20),
            Text("Luas: ${luas.toStringAsFixed(2)}"),
            Text("Keliling: ${keliling.toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }
}

// Halaman Limas (Formerly Kubus)
class LimasPage extends StatefulWidget {
  @override
  _LimasPageState createState() => _LimasPageState();
}

class _LimasPageState extends State<LimasPage> {
  final TextEditingController alas = TextEditingController();
  final TextEditingController tinggi = TextEditingController();
  double volume = 0, luasPermukaan = 0;

  void hitung() {
    double a = double.tryParse(alas.text) ?? 0;
    double t = double.tryParse(tinggi.text) ?? 0;

    setState(() {
      volume = (1 / 3) * (a * a) * t;
      double luasAlas = a * a;
      double tinggiSegitiga = Math.sqrt(Math.pow(t, 2) + Math.pow(a / 2, 2));
      double luasSegitiga = (1 / 2) * a * tinggiSegitiga;
      luasPermukaan = luasAlas + (4 * luasSegitiga);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hitung Limas")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: alas,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Panjang Sisi Alas",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: tinggi,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Tinggi Limas",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(onPressed: hitung, child: Text("Hitung")),
            SizedBox(height: 20),
            Text("Volume: ${volume.toStringAsFixed(2)}"),
            Text("Luas Permukaan: ${luasPermukaan.toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }
}

// Halaman Penghitung Hari
class HariPage extends StatefulWidget {
  @override
  _HariPageState createState() => _HariPageState();
}

class _HariPageState extends State<HariPage> {
  final List<String> hari = [
    "",
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
    "Minggu",
  ];
  final TextEditingController controller = TextEditingController();
  String hasil = "";

  void hitungHari() {
    int index = int.tryParse(controller.text) ?? 0;
    setState(() {
      hasil = (index >= 1 && index <= 7) ? hari[index] : "Tidak Valid";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Penghitung Hari")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Masukkan Angka (1-7)",
                helperText: "1=Senin, 2=Selasa, ..., 7=Minggu",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: hitungHari,
              child: Text("Tampilkan Hari"),
            ),
            SizedBox(height: 20),
            if (hasil.isNotEmpty)
              Text(
                "Hasil: $hasil",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: hasil != "Tidak Valid" ? Colors.blue : Colors.red,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Halaman Data Diri
class DataDiriPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Diri")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue[100],
                backgroundImage: AssetImage("assets/me.jpg"),
              ),
              SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Ahmad Zakaria",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("NIM: 123220077"),
                      Text("Kelas: IF-A"),
                      Text("Hobby: Musik"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
