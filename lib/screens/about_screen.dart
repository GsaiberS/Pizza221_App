import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Основной цвет акцента
    const Color primaryColor = Color.fromRGBO(208, 157, 176, 1);

    return Scaffold(
      appBar: AppBar(
        title: const Text('О нас'),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок
            Text(
              'Кемеровский кооперативный техникум — это первый шаг на пути к будущей успешной карьере.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 24),

            // Контактная информация
            Text(
              'Контактная информация',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: Icon(FontAwesomeIcons.locationDot, color: primaryColor),
              title: Text(
                'г. Кемерово, ул. Тухачевского, 32',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.phone, color: primaryColor),
              title: Text(
                '+7 (777) 666 55 44',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.envelope, color: primaryColor),
              title: Text(
                'Soborovets@gmail.com',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            const SizedBox(height: 24),

            // Ссылки на социальные сети
            Text(
              'Ссылки на меня',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                SocialButton(
                  icon: FontAwesomeIcons.github,
                  label: 'GitHub',
                  url: 'https://github.com/GsaiberS',
                  color: primaryColor,
                ),
                SocialButton(
                  icon: FontAwesomeIcons.vk,
                  label: 'VK',
                  url: 'https://vk.com/rsoborovets',
                  color: primaryColor,
                ),
                SocialButton(
                  icon: FontAwesomeIcons.telegram,
                  label: 'Telegram',
                  url: 'https://t.me/Rsobr',
                  color: primaryColor,
                ),
                SocialButton(
                  icon: FontAwesomeIcons.steam,
                  label: 'Steam',
                  url: 'https://steamcommunity.com/profiles/76561199438628487/',
                  color: primaryColor,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Статичная карта
            Text(
              'Мы на карте',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://static-maps.yandex.ru/1.x/?ll=86.057517,55.345490&z=16&l=map&size=600,300&pt=86.057517,55.345490,pm2rdm',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Виджет для кнопок социальных сетей
class SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;
  final Color color;

  const SocialButton({
    super.key,
    required this.icon,
    required this.label,
    required this.url,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => AboutScreen._launchUrl(url),
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}