import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_221/pages/login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Основной цвет акцента
    const Color primaryColor = Color.fromRGBO(208, 157, 176, 1);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 240, 245),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Регистрация'),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Заголовок
                Text(
                  'Регистрация',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Заполните форму ниже для регистрации',
                  style: TextStyle(color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Поля ввода
                _buildInputField(
                  icon: FontAwesomeIcons.user,
                  hintText: 'Имя пользователя',
                ),
                const SizedBox(height: 16),
                _buildInputField(
                  icon: FontAwesomeIcons.envelope,
                  hintText: 'Email',
                ),
                const SizedBox(height: 16),
                _buildInputField(
                  icon: FontAwesomeIcons.lock,
                  hintText: 'Пароль',
                  obscure: true,
                ),
                const SizedBox(height: 16),
                _buildInputField(
                  icon: FontAwesomeIcons.lock,
                  hintText: 'Подтвердите пароль',
                  obscure: true,
                ),

                const SizedBox(height: 24),

                // Кнопка регистрации
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: обработка регистрации
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Регистрация успешна!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: primaryColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    shadowColor: Colors.black.withOpacity(0.2),
                  ),
                  icon: const Icon(Icons.person_add, size: 20),
                  label: const Text(
                    'Зарегистрироваться',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 16),

                // Разделитель с текстом "или"
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey[300])),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'или',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey[300])),
                    ],
                  ),
                ),

                // Вход через социальные сети
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        // TODO: реализация входа через Steam
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Регистрация через Steam')),
                        );
                      },
                      icon: FaIcon(FontAwesomeIcons.steam, color: Colors.blue),
                      iconSize: 32,
                    ),
                    IconButton(
                      onPressed: () {
                        // TODO: реализация входа через GitHub
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Регистрация через GitHub')),
                        );
                      },
                      icon: FaIcon(FontAwesomeIcons.github, color: Colors.black),
                      iconSize: 32,
                    ),
                    IconButton(
                      onPressed: () {
                        // TODO: реализация входа через Telegram
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Регистрация через Telegram')),
                        );
                      },
                      icon: FaIcon(FontAwesomeIcons.telegram, color: Colors.blue[600]),
                      iconSize: 32,
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Ссылка на вход
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Уже есть аккаунт?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      child: Text(
                        'Войти',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Виджет поля ввода с анимацией
  Widget _buildInputField({required IconData icon, required String hintText, bool obscure = false}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: const Color.fromRGBO(208, 157, 176, 1)),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}