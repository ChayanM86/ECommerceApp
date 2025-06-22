class Product {
  final String name;
  final String category;
  final String description;
  final double price;
  final double? oldprice;
  final String imageUrl;
  final bool isfavorite;
  final List<String> categories;

  Product({
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.oldprice,
    this.isfavorite = false,
    required this.categories,
  });

  get isNew => null;
}

// ✅ Sample data (move this OUTSIDE the class)
final List<Product> sampleProducts = [
  Product(
    name: 'Smartphone',
    category: 'Electronics',
    description: 'Latest smartphone with advanced features.',
    price: 699.99,
    imageUrl:
        'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6341/6341355_sd.jpg',
    oldprice: 799.99,
    isfavorite: false,
    categories: ['Electronics', 'Mobile'],
  ),
  Product(
    name: 'Running Shoes',
    category: 'Fashion',
    description: 'Comfortable running shoes for all-day wear.',
    price: 89.99,
    imageUrl:
        'https://rukminim1.flixcart.com/image/832/832/kle24cw0/shoe/w/c/l/8-running-shoes-8-nivia-silver-original-imagygn9d9uxhnhy.jpeg?q=70',
    isfavorite: true,
    categories: ['Fashion', 'Footwear'],
  ),
  Product(
    name: 'Coffee Maker',
    category: 'Home & Kitchen',
    description: 'Brew your favorite coffee at home.',
    price: 49.99,
    imageUrl:
        'https://i5.walmartimages.com/asr/0466ef2c-01bd-4bdc-8c63-157494098eeb.6e662c78bba6562708b423a75c868575.jpeg',
    isfavorite: false,
    categories: ['Home & Kitchen', 'Appliances'],
  ),
  Product(
    name: 'Gaming Laptop',
    category: 'Computers',
    description: 'High-performance laptop for gaming and work.',
    price: 1299.99,
    imageUrl: 'https://m.media-amazon.com/images/I/81fZmxBbQgL.jpg',
    oldprice: 1499.99,
    isfavorite: true,
    categories: ['Computers', 'Gaming'],
  ),
  Product(
    name: 'Wireless Headphones',
    category: 'Audio',
    description: 'Noise-cancelling wireless headphones with great sound.',
    price: 199.99,
    imageUrl:
        'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6267/6267219_rd.jpg',
    isfavorite: false,
    categories: ['Audio', 'Accessories'],
  ),
  Product(
    name: 'Smartwatch',
    category: 'Wearables',
    description: 'Track your fitness and stay connected with this smartwatch.',
    price: 249.99,
    imageUrl:
        'https://media.croma.com/image/upload/v1685025286/Croma%20Assets/Communication/Wearable%20Devices/Images/270461_3_woon40.png',
    isfavorite: true,
    categories: ['Wearables', 'Health'],
  ),
];


// // Factory method to create a Product from a map
// factory Product.fromMap(Map<String, dynamic> data) {
//   return Product(
//     id: data['id'] as String,
//     title: data['title'] as String,
//     description: data['description'] as String,
//     price: (data['price'] as num).toDouble(),
//     imageUrl: data['imageUrl'] as String,
//     categories: List<String>.from(data['categories'] as List),
//   );
// }

// // Method to convert a Product to a map
// Map<String, dynamic> toMap() {
//   return {
//     'id': id,
//     'title': title,
//     'description': description,
//     'price': price,
//     'imageUrl': imageUrl,
//     'categories': categories,
//   };
//   }
// }
