import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<String> cartItems;
  final Function(int) removeFromCart;

  CartPage({required this.cartItems, required this.removeFromCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Kosongkan AppBar title untuk memindahkan judul ke body
        title: SizedBox.shrink(),
        backgroundColor: Colors.transparent,
        elevation: 0, // Hilangkan bayangan AppBar
      ),
      body: Column(
        children: [
          // Tambahkan teks "Keranjang" di bagian atas body
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Keranjang',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cartItems[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      String removedItem = cartItems[index];
                      removeFromCart(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$removedItem dihapus dari keranjang.'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
