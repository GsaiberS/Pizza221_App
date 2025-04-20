import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_221/pages/register_page.dart';
import 'package:pizza_221/screens/product_screen.dart';
import 'package:pizza_221/screens/about_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PizzaISApp());
}

class PizzaISApp extends StatelessWidget {
  const PizzaISApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Пиццерия ИС-221',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Основной цвет акцента
    const Color primaryColor = Color.fromRGBO(208, 157, 176, 1);

    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 10),
            const Text(
              'ПИЦЦЕРИЯ ИС-221®',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Приветствие
            Center(
              child: Column(
                children: [
                  const Text(
                    'Добро пожаловать в Пиццерию ИС-221!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Лучшая пицца для вас и ваших близких!',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Преимущества
            Text(
              'Наши преимущества',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                AdvantageCard(
                  icon: FontAwesomeIcons.seedling,
                  title: 'Свежие ингредиенты',
                  description: 'Только лучшие продукты для вашей пиццы.',
                ),
                AdvantageCard(
                  icon: FontAwesomeIcons.truckFast,
                  title: 'Быстрая доставка',
                  description: 'Гарантируем доставку за 30 минут.',
                ),
                AdvantageCard(
                  icon: FontAwesomeIcons.userTie,
                  title: 'Опытные повара',
                  description: 'Мастера своего дела готовят для вас.',
                ),
                AdvantageCard(
                  icon: FontAwesomeIcons.percent,
                  title: 'Гибкая система скидок',
                  description: 'Специальные предложенияв.',
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Отзывы
            Text(
              'Отзывы наших клиентов',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
            ),
            const SizedBox(height: 12),
            Column(
              children: const [
                ReviewCard(
                  name: 'Анна',
                  text: 'Очень вкусно! Обязательно закажу ещё.',
                  stars: 5,
                ),
                ReviewCard(
                  name: 'Игорь',
                  text: 'Быстро доставили и горячая пицца. Спасибо!',
                  stars: 4,
                ),
                ReviewCard(
                  name: 'Мария',
                  text: 'Хороший сервис и вкусная еда. Рекомендую!',
                  stars: 5,
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Меню (Drawer)
class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color.fromRGBO(208, 157, 176, 1);

    return Drawer(
      backgroundColor: const Color(0xFFFDEDEC),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.restaurant_menu, size: 40, color: Colors.white),
                SizedBox(height: 8),
                Text(
                  'Меню',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.userPlus, color: Colors.pink),
            title: const Text('Регистрация'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.house, color: Colors.pink),
            title: const Text('Главная'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.pizzaSlice, color: Colors.pink),
            title: const Text('Каталог'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.infoCircle, color: Colors.pink),
            title: const Text('О нас'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Карточка преимуществ
class AdvantageCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const AdvantageCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color.fromRGBO(208, 157, 176, 1);

    return Container(
      width: 150,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 30, color: primaryColor),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

// Карточка отзыва
class ReviewCard extends StatelessWidget {
  final String name;
  final String text;
  final int stars;

  const ReviewCard({
    super.key,
    required this.name,
    required this.text,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color.fromRGBO(208, 157, 176, 1);

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: primaryColor,
          child: Icon(FontAwesomeIcons.user, color: Colors.white),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text),
            const SizedBox(height: 4),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < stars ? Icons.star : Icons.star_border,
                  size: 18,
                  color: Colors.amber,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}