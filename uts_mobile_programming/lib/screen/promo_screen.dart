import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';

class PromotionPage extends StatelessWidget {
  const PromotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
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
        padding: const EdgeInsets.all(16.0),
        children: [
          // Add a featured promotional banner at the top
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset('assets/pict1.jpeg', // URL for banner
                fit: BoxFit.cover,
                width: double.infinity,
                height: 180,
              ),
            ),
          ),
          PromotionCard(
            imageUrl: 'https://picsum.photos/540', // URL image
            title: 'Promo 1 - Buy 1 Get 1 Free',
            description:
                'Enjoy a special offer! Buy 1 set and get 1 drink for free.',
            onClaim: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Promo 1 claimed!')),
              );
            },
          ),
          PromotionCard(
            imageUrl: 'https://picsum.photos/541', // URL image
            title: 'Promo 2 - Cashback 25%',
            description:
                'Get 25% cashback on every food purchase using this app.',
            onClaim: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Promo 2 claimed!')),
              );
            },
          ),
          PromotionCard(
            imageUrl: 'https://picsum.photos/542', // URL image
            title: 'Promo 3 - 30% Discount',
            description:
                'Special 30% discount for new customers. Valid on all food items.',
            onClaim: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Promo 3 claimed!')),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PromotionCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final VoidCallback onClaim;

  const PromotionCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.onClaim,
  });

  @override
  _PromotionCardState createState() => _PromotionCardState();
}

class _PromotionCardState extends State<PromotionCard> {
  bool isSaved = false; // Track if the promotion is saved

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: widget.onClaim,
                      style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF8811),
                              foregroundColor: Colors.black,
                              elevation: 5,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                      child: const Text('Claim Now'),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Logic for sharing promo
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Promo shared!')),
                            );
                          },
                          icon: const Icon(Icons.share, color: Colors.orange),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isSaved = !isSaved; // Toggle saved state
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(isSaved
                                      ? 'Promo saved for later!'
                                      : 'Promo removed from saved!')),
                            );
                          },
                          icon: Icon(
                            isSaved ? Icons.bookmark : Icons.bookmark_border,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
