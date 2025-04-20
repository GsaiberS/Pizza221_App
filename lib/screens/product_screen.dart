import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/product.dart';
import 'order_template.dart'; // Модель Product
import 'product_detail_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Product> cartItems = [];

  final Map<String, String> categoryTranslations = {
    'Пицца': 'pizza',
    'Закуски': 'snack',
    'Напитки': 'drink',
    'Соусы': 'sauce',
  };

  final List<String> categories = ['Пицца', 'Закуски', 'Напитки', 'Соусы'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Удаление товара из корзины
  void _removeFromCart(Product product) {
    setState(() {
      cartItems.remove(product); // Удаляем товар из корзины
    });
  }

  // Добавление товара в корзину или увеличение его количества
  void _addToCart(Product product) {
    setState(() {
      bool productExists = cartItems.any((item) => item.id == product.id);
      if (productExists) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${product.name} уже в корзине')),
        );
      } else {
        cartItems.add(product); // Добавляем новый товар
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${product.name} добавлен в корзину')),
        );
      }
    });
  }

  // Получаем продукты по категории
  List<Product> getProductsByCategory(String category) {
    final categoryEn = categoryTranslations[category];
    return allProducts.where((p) => p.category == categoryEn).toList();
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color.fromRGBO(208, 157, 176, 1);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Каталог'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
            tabs: categories.map((c) => Tab(text: c)).toList(),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: categories.map((category) {
          final items = getProductsByCategory(category);
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.5, // Увеличиваем высоту карточек
            ),
            itemBuilder: (context, index) {
              final product = items[index];
              return _buildProductCard(product, primaryColor);
            },
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderTemplate(
                cartItems: cartItems,
                onRemoveFromCart: _removeFromCart,
                onAddToCart: _addToCart,
                onRemoveOneFromCart: _removeFromCart,
              ),
            ),
          );
        },
        backgroundColor: primaryColor,
        child: const Icon(Icons.shopping_cart, color: Colors.white),
      ),
    );
  }

  // Виджет карточки продукта с анимацией
  Widget _buildProductCard(Product product, Color primaryColor) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Изображение продукта
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  product.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Описание продукта
            Expanded(
              flex: 5, // Увеличиваем высоту для текста
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Название продукта
                    Text(
                      product.name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Описание продукта
                    Text(
                      product.description,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    // Цена продукта
                    Text(
                      '${product.price} ₽',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Кнопка "Купить"
                    ElevatedButton(
                      onPressed: () => _addToCart(product),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor, // Цвет фона кнопки
                        foregroundColor: Colors.white, // Цвет текста (белый)
                        minimumSize: const Size(double.infinity, 30), // Уменьшаем высоту кнопки
                        padding: const EdgeInsets.symmetric(vertical: 3), // Уменьшаем вертикальные отступы
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Скругление углов
                        ),
                      ),
                      child: const Text(
                        'Купить',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}