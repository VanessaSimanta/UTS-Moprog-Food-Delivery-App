import 'package:flutter/material.dart';

class AddOnsModal extends StatefulWidget {
  final Map<String, dynamic> item;
  final Function(List<Map<String, dynamic>>) onAddOnsSelected;

  AddOnsModal({required this.item, required this.onAddOnsSelected});

  @override
  _AddOnsModalState createState() => _AddOnsModalState();
}

class _AddOnsModalState extends State<AddOnsModal> {
  // Daftar ukuran yang bisa dipilih
  List<Map<String, dynamic>> sizeOptions = [
    {'size': 'Small', 'price': 0},
    {'size': 'Medium', 'price': 5000},
    {'size': 'Large', 'price': 10000},
  ];

  String selectedSize = 'Small'; // Default ukuran yang dipilih

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Menambahkan SafeArea di sini
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih Ukuran',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold), // Ukuran font dikecilkan
            ),
            const Divider(),
            // Mengubah tampilan menjadi vertikal
            ListView.builder(
              shrinkWrap: true,
              itemCount: sizeOptions.length,
              itemBuilder: (context, index) {
                final size = sizeOptions[index];
                return RadioListTile<String>(
                  title: Text('${size['size']} (+Rp ${size['price']})',
                      style: const TextStyle(fontSize: 12)),
                  value: size['size'],
                  groupValue: selectedSize,
                  onChanged: (String? value) {
                    setState(() {
                      selectedSize = value!;
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Kirim ukuran yang dipilih kembali ke parent widget
                final selectedSizeOption = sizeOptions
                    .firstWhere((size) => size['size'] == selectedSize);
                final selectedAddOns = [
                  {
                    'name': selectedSize,
                    'price': selectedSizeOption['price'],
                    'isSelected': true
                  },
                ];
                widget.onAddOnsSelected(selectedAddOns);
                Navigator.pop(context); // Tutup modal setelah memilih
              },
              child: const Text('Pilih Ukuran'),
              style: ElevatedButton.styleFrom(
                minimumSize:
                    const Size(double.infinity, 40),
                    backgroundColor: const Color(0xFFFF8811),
                    foregroundColor: Colors.black, // Full width button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
