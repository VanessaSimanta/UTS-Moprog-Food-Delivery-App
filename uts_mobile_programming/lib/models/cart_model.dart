import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl package
import 'package:uts_mobile_programming/screen/payment.dart';

class CartModel with ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  // Format untuk mata uang Rupiah
  final currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  void addItem(Map<String, dynamic> item) {
    final existingItemIndex =
        _items.indexWhere((cartItem) => cartItem['name'] == item['name']);
    if (existingItemIndex != -1) {
      _items[existingItemIndex]['quantity']++;
    } else {
      _items.add({
        ...item,
        'quantity': 1,
      });
    }
    notifyListeners();
  }

  // Fungsi untuk menghapus item dari keranjang
  void removeItem(Map<String, dynamic> item) {
    _items.remove(item);
    notifyListeners();
  }

  // Fungsi untuk mengupdate jumlah item
  void updateItemQuantity(Map<String, dynamic> item, int newQuantity) {
    final existingItemIndex =
        _items.indexWhere((cartItem) => cartItem['name'] == item['name']);
    if (existingItemIndex != -1) {
      if (newQuantity > 0) {
        _items[existingItemIndex]['quantity'] = newQuantity;
      } else {
        removeItem(item);
      }
    }
    notifyListeners();
  }

  // Fungsi untuk menghitung total harga
  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  // Fungsi untuk menampilkan Cart dalam modal bottom sheet
  void showCart(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder( // Gunakan StatefulBuilder
          builder: (context, setState) {  // Tambahkan setState di sini
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Keranjang Belanja',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  if (_items.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Keranjang Anda kosong',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    )
                  else
                    ..._items.map((item) {
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${currencyFormat.format(item['price'])}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove_circle_outline),
                                    onPressed: () {
                                      setState(() {
                                        updateItemQuantity(item, item['quantity'] - 1);
                                      });
                                    },
                                  ),
                                  Text(
                                    '${item['quantity']}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add_circle_outline),
                                    onPressed: () {
                                      setState(() {
                                        item['quantity']++;
                                      });
                                      Navigator.pop(context);
                                      showCart(context);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  if (_items.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Logic for proceeding to payment
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentPage(cartItems: _items),
                            ),
                          );
                        },
                        child: const Text('Lanjutkan ke Pembayaran'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 40), // Full width button
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      } 
    ); 
  }
}
