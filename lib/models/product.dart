class Product {
  final int id; // Уникальный идентификатор
  final String name;
  final String description;
  final String imagePath;
  final int price;
  final String category;
  int quantity; // Новое поле для количества

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    this.quantity = 1, // По умолчанию количество = 1
  });
}


// Пример списка продуктов
final List<Product> allProducts = [
  Product(
    id: 1,
    name: 'Мясная с аджикой',
    description: 'Баварские колбаски, аджика, чоризо, цыпленок, пепперони, моцарелла, томатный соус',
    imagePath: 'assets/images/1.png',
    price: 469,
    category: 'pizza',
    quantity: 1,
  ),
  Product(
    id: 2,
    name: 'Диабло',
    description: 'Чоризо, халапеньо, BBQ, митболы, томаты, моцарелла, томатный соус',
    imagePath: 'assets/images/2.png',
    price: 529,
    category: 'pizza',
    quantity: 1,
  ),
  Product(
    id: 3,
    name: 'Кола-барбекю',
    description: 'Говядина, пепперони, чоризо, кола-BBQ, моцарелла',
    imagePath: 'assets/images/3.png',
    price: 479,
    category: 'pizza',
    quantity: 1,
  ),
  Product(
    id: 4,
    name: 'Картошка Фри',
    description: 'Хрустящая, золотистая Картошка Фри',
    imagePath: 'assets/images/4.png',
    price: 137,
    category: 'snack',
    quantity: 1,
  ),
  Product(
    id: 5,
    name: 'Добрый Кола',
    description: 'Сладкая газировка 1л',
    imagePath: 'assets/images/5.png',
    price: 120,
    category: 'drink',
    quantity: 1,
  ),
  Product(
    id: 6,
    name: 'Сырный Соус',
    description: 'Мега СЫЫЫРНЫЙ!!! соус',
    imagePath: 'assets/images/6.png',
    price: 70,
    category: 'sauce',
    quantity: 1,
  ),
  Product(
    id: 7,
    name: 'Ветчина и сыр',
    description: 'Ветчина, моцарелла, соус альфред',
    imagePath: 'assets/images/7.png',
    price: 549,
    category: 'pizza',
    quantity: 1,
  ),
  Product(
    id: 8,
    name: 'Баварский ланчбокс',
    description: 'Креветки в хрустящей панировке',
    imagePath: 'assets/images/8.png',
    price: 199,
    category: 'snack',
    quantity: 1,
  ),
  Product(
    id: 9,
    name: 'Креветки',
    description: 'Цельные креветки в хрустящей панировке',
    imagePath: 'assets/images/9.png',
    price: 199,
    category: 'snack',
    quantity: 1,
  ),
  Product(
    id: 10,
    name: 'Супермясной Додстер',
    description: 'Цыпленок, моцарелла, митболы, чоризо, бургер-соус',
    imagePath: 'assets/images/10.png',
    price: 219,
    category: 'snack',
    quantity: 1,
  ),
  Product(
    id: 11,
    name: 'Морс Черная смородина',
    description: 'Фирменный ягодный морс из черной смородины',
    imagePath: 'assets/images/11.png',
    price: 219,
    category: 'drink',
    quantity: 1,
  ),
  Product(
    id: 12,
    name: 'Чесночный',
    description: 'Фирменный чесночный соус для бортиков и закусок',
    imagePath: 'assets/images/12.png',
    price: 70,
    category: 'sauce',
    quantity: 1,
  ),
  Product(
    id: 13,
    name: 'Малиновое варенье',
    description: 'Идеально к сырникам, но их нет XD',
    imagePath: 'assets/images/13.png',
    price: 70,
    category: 'sauce',
    quantity: 1,
  ),
];
