import 'package:flutter/material.dart';

class BuyNowPage extends StatelessWidget {
  const BuyNowPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Now'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Book Name', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            // Add other content for Buy Now page
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the first page
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
