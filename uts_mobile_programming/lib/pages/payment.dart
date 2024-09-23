import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const PaymentPage({super.key, required this.cartItems});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPaymentMethod = '';

  @override
  Widget build(BuildContext context) {
    int totalPrice =
        widget.cartItems.fold(0, (total, item) => total + item['price'] as int);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...widget.cartItems.map((item) => ListTile(
                  title: Text(item['name']),
                  trailing: Text('Rp ${item['price']}'),
                )),
            const Divider(),
            ListTile(
              title: const Text(
                'Total',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                'Rp ${totalPrice.toString()}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Choose payment method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            PaymentMethodTile(
              icon: Icons.credit_card,
              title: 'Credit Card',
              selectedMethod: selectedPaymentMethod,
              currentMethod: 'Credit Card',
              onTap: () {
                setState(() {
                  selectedPaymentMethod = 'Credit Card';
                });
              },
            ),
            PaymentMethodTile(
              icon: Icons.account_balance_wallet,
              title: 'GoPay',
              selectedMethod: selectedPaymentMethod,
              currentMethod: 'GoPay',
              onTap: () {
                setState(() {
                  selectedPaymentMethod = 'GoPay';
                });
              },
            ),
            PaymentMethodTile(
              icon: Icons.money,
              title: 'Cash',
              selectedMethod: selectedPaymentMethod,
              currentMethod: 'Cash',
              onTap: () {
                setState(() {
                  selectedPaymentMethod = 'Cash';
                });
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: selectedPaymentMethod.isEmpty
                  ? null
                  : () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Processing payment via $selectedPaymentMethod...')),
                      );
                    },
              child: const Text('Pay now'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
                minimumSize: const Size(double.infinity, 50), // Full width button
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
  final String selectedMethod;
  final String currentMethod;
  final VoidCallback onTap;

  const PaymentMethodTile({super.key, 
    required this.icon,
    required this.title,
    required this.selectedMethod,
    required this.currentMethod,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: selectedMethod == currentMethod
          ? const Icon(Icons.check, color: Colors.green)
          : const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
