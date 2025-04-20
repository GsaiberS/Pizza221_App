import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/product.dart'; // Модель Product

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color.fromRGBO(208, 157, 176, 1);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          product.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Изображение товара
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                product.imagePath,
                height: 300, // Увеличенная высота изображения
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),

            // Название товара
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            // Описание товара
            Text(
              product.description,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Цена товара
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${product.price} ₽',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Логика добавления товара в корзину
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Товар добавлен в корзину')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: const Size(160, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    shadowColor: Colors.black.withOpacity(0.2),
                  ),
                  icon: const Icon(Icons.shopping_cart, size: 20),
                  label: const Text(
                    'Добавить в корзину',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Дополнительная информация (например, ингредиенты или отзывы)
            Text(
              'Ингредиенты:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Свежие продукты, сыр, томатный соус, специи.',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}