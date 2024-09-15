import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';
import 'package:uts_mobile_programming/widget/nav_bar.dart';
import 'package:uts_mobile_programming/pages/home.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar saat ini
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Call Us When You Need !'),
        backgroundColor: Colors.orange,
      ),
      body: Stack(
        children: [
          // Header Image Section
          Positioned(
            top: 0, // Menyesuaikan agar tidak menyentuh AppBar
            left: 0,
            right: 0,
            height: screenHeight * 0.25,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/header_image.jpg'), // Ganti dengan path gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Ada pertanyaan atau keluhan ? Kami siap bantu !',
                  style: TextStyle(
                    fontSize: screenWidth * 0.07,
                    color: const Color.fromARGB(224, 230, 198, 125),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          // Main Content Section
          Positioned(
            top: kToolbarHeight + screenHeight * 0.20, // Menyesuaikan dengan tinggi header
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, // Padding disesuaikan dengan lebar layar
                vertical: screenHeight * 0.02,  // Padding vertikal disesuaikan dengan tinggi layar
              ),
              child: SingleChildScrollView( // Menambahkan scroll jika konten terlalu panjang
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Contact Us Section with Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.contact_support, size: screenWidth * 0.1, color: Colors.orange),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          'Contact Us',
                          style: TextStyle(
                            fontSize: screenWidth * 0.06, // Ukuran font disesuaikan dengan layar
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.orange, thickness: 2), // Pembatas setelah "Contact Us"
                    SizedBox(height: screenHeight * 0.02), // Jarak vertikal disesuaikan
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orange[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.phone, color: Colors.orange),
                            title: const Text('Phone'),
                            subtitle: const Text('0822-123-7768'),
                            onTap: () {
                              // Implement phone call functionality
                            },
                          ),
                          Divider(),
                          ListTile(
                            leading: const Icon(Icons.email, color: Colors.orange),
                            title: const Text('Email'),
                            subtitle: const Text('helpcenter@gmail.com'),
                            onTap: () {
                              // Implement email functionality
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04), // Jarak vertikal disesuaikan

                    // Feedback Form Section
                    Text(
                      'Feedback Form',
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(color: Colors.orange, thickness: 2), // Divider after Feedback Form title
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Untuk kritik dan saran serta pertanyaan lebih lanjut bisa mengisi data di bawah ini. Feedback kalian sangat membantu kami untuk terus berkembang!.',
                      style: TextStyle(fontSize: screenWidth * 0.04),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Your Name',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Your Email',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      maxLines: 4,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Your Feedback',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    ElevatedButton(
                      onPressed: () {
                        // Implement feedback submission functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // Background color
                        foregroundColor: Colors.white,  // Text color
                      ),
                      child: const Text('Submit Feedback'),
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    // FAQ Section with Cards
                    Text(
                      'FAQ',
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(color: Colors.orange, thickness: 2), // Divider after FAQ title
                    SizedBox(height: screenHeight * 0.02),
                    ..._buildFAQ(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to create FAQ section with Cards
  List<Widget> _buildFAQ() {
    final faqList = [
      {
        'question': 'Bagaimana jika pesanan yang dikirim tidak sesuai?',
        'answer': 'Anda dapat langsung menghubungi customer service kami di nomor yang sudah tertera. Dengan sigap kami akan mengatur ulang pesanan anda.'
      },
      {
        'question': 'Apakah ada batasan area pengiriman?',
        'answer': 'Ya, layanan kami hanya mencakup area tertentu. Anda dapat memeriksa area pengiriman kami melalui aplikasi atau situs web kami.'
      },
      {
        'question': 'Bagaimana cara menggunakan kode promo?',
        'answer': 'Anda dapat claim di menu promo yang kami sediakan dan nikmati berbagai promo jika sudah sering berlangganan.'
      },
      {
        'question': 'Apa yang harus dilakukan jika pesanan terlambat?',
        'answer': 'Jika pesanan Anda terlambat, Anda dapat menghubungi layanan pelanggan kami melalui telepon atau email untuk mendapatkan bantuan lebih lanjut.'
      },
      {
        'question': 'Apakah ada biaya tambahan untuk pengiriman cepat?',
        'answer': 'Ya, pengiriman cepat akan dikenakan biaya tambahan yang akan diinformasikan pada saat Anda memilih opsi pengiriman tersebut.'
      },
    ];

    return faqList.map((faq) {
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ExpansionTile(
          title: Text(
            faq['question']!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(faq['answer']!),
            ),
          ],
        ),
      );
    }).toList();
  }
}

void main() {
  runApp(const MaterialApp(
    home: HelpCenter(),
  ));
}