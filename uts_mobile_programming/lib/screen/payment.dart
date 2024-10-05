import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/screen/tracking.dart';
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';

class PaymentPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const PaymentPage({super.key, required this.cartItems});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPaymentMethod = '';

  // Function to format the currency
  String formatCurrency(int amount) {
    final formatter = RegExp(r'(\d)(?=(\d{3})+(?!\d))');
    return 'Rp ${amount.toString().replaceAllMapped(formatter, (match) => '${match[1]}.')}';
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = widget.cartItems.fold(0, (total, item) {
      int itemPrice = item['price'] as int;
      int itemQuantity = item['quantity'] is int
          ? item['quantity'] as int
          : 0; // Default to 0 if quantity is not an int
      return total + (itemPrice * itemQuantity);
    });

    return Scaffold(
      appBar: const AppBarWidget(
        title: Text(
          "Payment Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        showBackArrow: true,
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ...widget.cartItems.map((item) => ListTile(
                          title: Text(item['name']),
                          subtitle: Text('Qty: ${item['quantity']}'),
                          trailing: Text(
                              formatCurrency(item['price'] * item['quantity'])),
                        )),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        formatCurrency(totalPrice),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Choose Payment Method',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                      // Show processing message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Processing payment via $selectedPaymentMethod...',
                            textAlign: TextAlign.center,
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );

                      // Delay and navigate to TrackingScreen
                      Future.delayed(const Duration(seconds: 3), () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TrackingProgressScreen(
                              order: Order(
                                items: widget.cartItems.map((item) {
                                  return OrderItem(
                                    name: item['name'],
                                    rating: null,
                                    review: null,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        );
                      });
                    },
              child: const Text('Pay Now'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // Color of the button
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
                minimumSize:
                    const Size(double.infinity, 50), // Full width button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
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

  const PaymentMethodTile({
    super.key,
    required this.icon,
    required this.title,
    required this.selectedMethod,
    required this.currentMethod,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: selectedMethod == currentMethod
              ? Colors.orange.withOpacity(0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: selectedMethod == currentMethod
              ? const Icon(Icons.check, color: Colors.green)
              : const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
