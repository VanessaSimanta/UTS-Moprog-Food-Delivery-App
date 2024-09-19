import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';

class PromotionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: Text(
          "Promotions",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        showBackArrow: false,
        actions: [],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          PromotionCard(
            imageUrl: 'https://via.placeholder.com/150', // URL gambar promosi
            title: 'Promo 1 - Buy 1 Get 1 Free',
            description:
                'Nikmati promosi spesial, beli 1 paket dapat 1 minuman gratis!',
            onClaim: () {
              // Logic untuk claim promosi
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Promo 1 claimed!')),
              );
            },
          ),
          PromotionCard(
            imageUrl: 'https://via.placeholder.com/150', // URL gambar promosi
            title: 'Promo 2 - Cashback 25%',
            description:
                'Dapatkan cashback 25% untuk setiap pembelian makanan menggunakan aplikasi ini.',
            onClaim: () {
              // Logic untuk claim promosi
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Promo 2 claimed!')),
              );
            },
          ),
          PromotionCard(
            imageUrl: 'https://via.placeholder.com/150', // URL gambar promosi
            title: 'Promo 3 - Diskon 30%',
            description:
                'Diskon spesial 30% untuk pelanggan baru, berlaku untuk semua makanan.',
            onClaim: () {
              // Logic untuk claim promosi
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Promo 3 claimed!')),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PromotionCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final VoidCallback onClaim;

  const PromotionCard({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.onClaim,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl,
              fit: BoxFit.cover, height: 150, width: double.infinity),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: onClaim,
                    child: Text('Claim Now'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
