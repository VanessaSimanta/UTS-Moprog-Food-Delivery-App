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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
            shrinkWrap: true, // Mengatur ukuran ListView sesuai dengan konten
            itemCount: order.items.length,
            itemBuilder: (context, index) {
              final item = order.items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5, // Menambahkan shadow pada card
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal, // Warna teks untuk judul
                            ),
                          ),
                        ),
                        const SizedBox(
                            height: 10), // Spasi antara judul dan rating
                        Center(
                          child: RatingBar.builder(
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
                        ),
                        const SizedBox(
                            height: 15), // Spasi antara rating dan ulasan
                        TextField(
                          maxLines: 3, // Membatasi tinggi input teks ulasan
                          decoration: InputDecoration(
                            hintText: 'Write a review here...',
                            fillColor:
                                Colors.grey[200], // Warna background input
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (value) {
                            item.review = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 230, 184, 105),
        icon: const Icon(Icons.check),
        label: const Text('Submit'),
        onPressed: () {
          saveReview(order, context);
        },
      ),
    );
  }

  void saveReview(tracking.Order order, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Your ratings & reviews have been submitted successfully!",
        ),
        backgroundColor: Color.fromARGB(255, 234, 154, 16),
      ),
    );

    // Kembali ke halaman utama dengan delay kecil
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.popUntil(context, (route) => route.isFirst);
    });
  }
}
