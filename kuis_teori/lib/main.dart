import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
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
          children: [
            TextField(
              controller: a,
              decoration: InputDecoration(labelText: "Sisi Atas"),
            ),
            TextField(
              controller: b,
              decoration: InputDecoration(labelText: "Sisi Bawah"),
            ),
            TextField(
              controller: h,
              decoration: InputDecoration(labelText: "Tinggi"),
            ),
            ElevatedButton(onPressed: hitung, child: Text("Hitung")),
            Text("Luas: \$luas"),
            Text("Keliling: \$keliling"),
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
  double volume = 0, keliling = 0;

  void hitung() {
    double s = double.tryParse(sisi.text) ?? 0;
    setState(() {
      volume = s * s * s;
      keliling = 12 * s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hitung Kubus")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: sisi,
              decoration: InputDecoration(labelText: "Sisi"),
            ),
            ElevatedButton(onPressed: hitung, child: Text("Hitung")),
            Text("Volume: \$volume"),
            Text("Keliling: \$keliling"),
          ],
        ),
      ),
    );
  }
}

// Halaman Penghitung Hari
class HariPage extends StatelessWidget {
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

  void hitungHari(BuildContext context) {
    int index = int.tryParse(controller.text) ?? 0;
    String namaHari = (index >= 1 && index <= 7) ? hari[index] : "Tidak Valid";
    showDialog(
      context: context,
      builder:
          (context) =>
              AlertDialog(title: Text("Hari"), content: Text(namaHari)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Penghitung Hari")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: "Masukkan Angka (1-7)"),
            ),
            ElevatedButton(
              onPressed: () => hitungHari(context),
              child: Text("Tampilkan Hari"),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/profile.jpg"),
            ),
            Text("Nama: John Doe"),
            Text("NIM: 12345678"),
            Text("Kelas: IF-E"),
            Text("Hobby: Coding"),
          ],
        ),
      ),
    );
  }
}
