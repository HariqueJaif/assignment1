

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book List'),
      ),
      body: ListView(
        children: const [
          BookCard(
            imageUrl: 'https://m.media-amazon.com/images/I/41hnl4MN0pL._SY342_.jpg',
            bookName: 'Himu Samagra Part -1',
            authorName: 'Humayun Ahmed',
            rating: 4.6,
            price: 250.0,
            description: 'Himu Samagra Part 1 is a collection of Bengali novels written by renowned author Humayun Ahmed. This anthology features the adventures and philosophical musings of the eccentric and enigmatic protagonist, Himu, offering readers a captivating blend of humor, introspection, and unconventional storytelling.',






          ),
          BookCard(
            imageUrl: 'https://m.media-amazon.com/images/I/41O2iwXeUBL._SY342_.jpg',
            bookName: 'Misir Ali Samagra Vol.1',
            authorName: 'Humayun Ahmed',
            rating: 4.5,
            price: 290.0,
            description: 'Misir Ali Vol. 1 is a compilation of Bengali novels created by the prolific writer Humayun Ahmed. The collection introduces readers to the character Misir Ali, a brilliant and analytical psychologist who delves into the complexities of the human mind. As Misir Ali encounters various enigmatic cases, the stories unfold with a mix of psychological intrigue, suspense, and philosophical insights, making it a captivating exploration of the human psyche.',
          ),
          // Add more BookCard widgets as needed
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String imageUrl;
  final String bookName;
  final String authorName;
  final double rating;
  final double price;
  final String description;

  const BookCard({
    Key? key,
    required this.imageUrl,
    required this.bookName,
    required this.authorName,
    required this.rating,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(
          imageUrl,
          width: 60.0,
          height: 80.0,
          fit: BoxFit.cover,
        ),
        title: Text(bookName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(authorName),
            Text('Rating: $rating'),
          ],
        ),
        trailing: ElevatedButton.icon(
          onPressed: () {
            // Navigate to the Buy Now page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BuyNowPage(
                  bookName: bookName,
                  imageUrl: imageUrl,
                  authorName: authorName,
                  price: price,
                  description: description,
                ),
              ),
            );
          },
          icon: const Icon(Icons.shopping_cart),
          label: const Text('Buy Now'),
        ),
      ),
    );
  }
}

class BuyNowPage extends StatelessWidget {
  final String bookName;
  final String imageUrl;
  final String authorName;
  final double price;
  final String description;

  const BuyNowPage({
    Key? key,
    required this.bookName,
    required this.imageUrl,
    required this.authorName,
    required this.price,
    required this.description,
  });

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
            Text(bookName, style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            Image.network(
              imageUrl,
              width: 200.0,
              height: 300.0,
              fit: BoxFit.cover,
            ),
            Text('Author: $authorName'),
            Text(description),
            Text('Price: \$BDT $price'),
            const SizedBox(height: 16.0),
            DropdownButton<String>(
              items: ['Bkash', 'Nagad', 'C O D']
                  .map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  })
                  .toList(),
              onChanged: (String? value) {
                // Handle dropdown item selection
              },
              hint: const Text('Select an option'),
            ),
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
