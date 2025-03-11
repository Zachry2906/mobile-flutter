import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  final String userName;

  const AboutPage({Key? key, required this.userName}) : super(key: key);
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 48, 168, 64),
        title: const Text(
          'About Page',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/customerService.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              'Ini adalah halaman About',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 48, 168, 64),
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "\nPertanyaan Umum (FAQ)\nTemukan jawaban atas berbagai pertanyaan yang sering ditanyakan oleh pengguna mengenai penggunaan aplikasi ini. Dari proses pendaftaran, cara membeli barang, hingga pengaturan akun, semua jawaban ada di sini untuk mempermudah pengalaman Anda.",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            Text(
              "Panduan Penggunaan\nPelajari langkah demi langkah cara menggunakan fitur-fitur aplikasi kami. Panduan ini akan membantu Anda memahami bagaimana memaksimalkan penggunaan aplikasi, mulai dari mencari produk hingga menyelesaikan transaksi dengan mudah",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            Text(
              "Kontak Dukungan\n Jika Anda membutuhkan bantuan lebih lanjut, tim dukungan kami siap membantu. Anda dapat menghubungi kami melalui email, telepon, atau live chat. Kami berkomitmen untuk memberikan solusi terbaik bagi setiap masalah atau pertanyaan yang Anda miliki..",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
