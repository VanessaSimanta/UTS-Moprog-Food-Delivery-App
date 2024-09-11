import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final int totalPrice = 25000; // Contoh harga pesanan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Nasi Ayam Telor Asin'),
              trailing: Text('Rp 23.000'),
            ),
            ListTile(
              title: Text('Nasi Ayam Cabai Garam'),
              trailing: Text('Rp 23.000'),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Total',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                'Rp ${totalPrice.toString()}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Choose payment method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            PaymentMethodTile(
              icon: Icons.credit_card,
              title: 'Credit Card',
              onTap: () {},
            ),
            PaymentMethodTile(
              icon: Icons.account_balance_wallet,
              title: 'GoPay',
              onTap: () {},
            ),
            PaymentMethodTile(
              icon: Icons.money,
              title: 'Cash',
              onTap: () {},
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Processing payment...')),
                );
              },
              child: Text('Pay now'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 18),
                minimumSize: Size(double.infinity, 50), // Full width button
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  PaymentMethodTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
