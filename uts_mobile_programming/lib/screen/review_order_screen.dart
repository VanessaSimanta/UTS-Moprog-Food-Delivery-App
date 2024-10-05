import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:uts_mobile_programming/screen/tracking.dart' as tracking;
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';

class ReviewOrderScreen extends StatelessWidget {
  final tracking.Order order; // Data pesanan

  const ReviewOrderScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: Text(
          "How is the menu?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        showBackArrow: false,
        actions: [],
      ),
      body: Center(
        // Membungkus seluruh konten di tengah
        child: ListView.builder(
          shrinkWrap: true, // Mengatur ukuran ListView sesuai dengan konten
          itemCount: order.items.length, // Berdasarkan jumlah item yang dipesan
          itemBuilder: (context, index) {
            final item = order.items[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Konten di tengah secara vertikal
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Konten di tengah secara horizontal
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                      height: 10), // Memberi jarak antara teks dan rating
                  RatingBar.builder(
                    initialRating: item.rating ?? 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      item.rating = rating; // Simpan rating
                    },
                  ),
                  const SizedBox(
                      height: 10), // Memberi jarak antara rating dan ulasan
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Write a review...',
                        border:
                            OutlineInputBorder(), // Tambah border untuk input review
                      ),
                      onChanged: (value) {
                        item.review = value; // Simpan ulasan
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () {
          // Simpan rating dan review ke database atau backend
          saveReview(order, context);
        },
      ),
    );
  }

  void saveReview(tracking.Order order, BuildContext context) {
    // Implementasi penyimpanan ke server atau local storage
    // Tampilkan pesan sukses
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content:
            Text("Your ratings & reviews have been submitted successfully!"),
      ),
    );

    // Kembali ke halaman utama
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.popUntil(context, (route) => route.isFirst);
    });
  }
}
