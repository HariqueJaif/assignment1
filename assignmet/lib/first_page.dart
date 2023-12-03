import 'package:flutter/material.dart';
import 'buy_now_page.dart';

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
            imageUrl:
                'https://m.media-amazon.com/images/I/41hnl4MN0pL._SY342_.jpg',
            bookName: 'Himu Samagra Part -1',
            authorName: 'Humayun Ahmed',
            rating: 4.6,
            price: 250.0,
            description:
                'Himu Samagra Part 1 is a collection of Bengali novels written by renowned author Humayun Ahmed. This anthology features the adventures and philosophical musings of the eccentric and enigmatic protagonist, Himu, offering readers a captivating blend of humor, introspection, and unconventional storytelling.',
          ),
          BookCard(
            imageUrl:
                'https://m.media-amazon.com/images/I/41O2iwXeUBL._SY342_.jpg',
            bookName: 'Misir Ali Samagra Vol.1',
            authorName: 'Humayun Ahmed',
            rating: 4.5,
            price: 290.0,
            description:
                'Misir Ali Vol. 1 is a compilation of Bengali novels created by the prolific writer Humayun Ahmed. The collection introduces readers to the character Misir Ali, a brilliant and analytical psychologist who delves into the complexities of the human mind. The stories unfold with a mix of psychological intrigue, suspense, and philosophical insights, making it a captivating exploration of the human psyche.',
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
      child: Column(
        children: [
          ListTile(
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
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Navigate to the Buy Now page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BuyNowPage(), // Use 'const' here
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Buy Now'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
