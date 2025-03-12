import 'package:flutter/material.dart';

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
    TrapesiumPage(),
    KubusPage(),
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
            label: "Trapesium",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: "Kubus"),
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

// Halaman Trapesium
class TrapesiumPage extends StatefulWidget {
  @override
  _TrapesiumPageState createState() => _TrapesiumPageState();
}

class _TrapesiumPageState extends State<TrapesiumPage> {
  final TextEditingController a = TextEditingController();
  final TextEditingController b = TextEditingController();
  final TextEditingController h = TextEditingController();
  double luas = 0, keliling = 0;

  void hitung() {
    double sisiA = double.tryParse(a.text) ?? 0;
    double sisiB = double.tryParse(b.text) ?? 0;
    double tinggi = double.tryParse(h.text) ?? 0;
    setState(() {
      luas = 0.5 * (sisiA + sisiB) * tinggi;
      keliling = sisiA + sisiB + (2 * tinggi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hitung Trapesium")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: a,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Sisi Atas",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: b,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Sisi Bawah",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: h,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Tinggi",
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

// Halaman Kubus
class KubusPage extends StatefulWidget {
  @override
  _KubusPageState createState() => _KubusPageState();
}

class _KubusPageState extends State<KubusPage> {
  final TextEditingController sisi = TextEditingController();
  double volume = 0, luasPermukaan = 0;

  void hitung() {
    double s = double.tryParse(sisi.text) ?? 0;
    setState(() {
      volume = s * s * s;
      luasPermukaan =
          6 * s * s; // Perbaikan: keliling seharusnya luas permukaan
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hitung Kubus")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: sisi,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Sisi",
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
