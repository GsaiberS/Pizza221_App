import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/product.dart'; // Модель Product

class OrderTemplate extends StatefulWidget {
  final List<Product> cartItems;
  final Function(Product) onRemoveFromCart;
  final Function(Product) onAddToCart;
  final Function(Product) onRemoveOneFromCart;

  const OrderTemplate({
    Key? key,
    required this.cartItems,
    required this.onRemoveFromCart,
    required this.onAddToCart,
    required this.onRemoveOneFromCart,
  }) : super(key: key);

  @override
  _OrderTemplateState createState() => _OrderTemplateState();
}

class _OrderTemplateState extends State<OrderTemplate> {
  late List<Product> _cartItems;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _fio;
  String? _email;
  String? _address;
  String? _phone;
  String? _paymentMethod;

  @override
  void initState() {
    super.initState();
    _cartItems = List.from(widget.cartItems); // Создаем копию списка товаров
  }

  // Метод для расчета общей стоимости товаров в корзине
  double calculateTotalPrice() {
    return _cartItems.fold(0, (total, product) => total + product.price);
  }

  @override
  Widget build(BuildContext context) {
    // Основной цвет
    final Color mainColor = Color.fromRGBO(208, 157, 176, 1);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Корзина",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: mainColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Список товаров
            _cartItems.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.cartShopping,
                    size: 80,
                    color: mainColor.withOpacity(0.6),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Корзина пуста",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
                : ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final product = _cartItems[index];
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        product.imagePath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${product.price} ₽",
                          style: TextStyle(
                            fontSize: 14,
                            color: mainColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.minus,
                                size: 16,
                                color: mainColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  widget.onRemoveOneFromCart(product);
                                  _cartItems = List.from(widget.cartItems); // Обновляем локальную копию
                                });
                              },
                            ),
                            Text(
                              '1', // Отображение количества товара
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.plus,
                                size: 16,
                                color: mainColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  widget.onAddToCart(product);
                                  _cartItems = List.from(widget.cartItems); // Обновляем локальную копию
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.trash,
                        size: 20,
                        color: Colors.redAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.onRemoveFromCart(product);
                          _cartItems = List.from(widget.cartItems); // Обновляем локальную копию
                        });
                      },
                    ),
                  ),
                );
              },
            ),

            // Блок с итоговой стоимостью
            if (_cartItems.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, -3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Итого:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "${calculateTotalPrice()} ₽",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                  ],
                ),
              ),

            // Форма оформления заказа
            if (_cartItems.isNotEmpty)
              Card(
                margin: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Оформление заказа",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Ваше ФИО",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Пожалуйста, введите ваше ФИО";
                            }
                            return null;
                          },
                          onSaved: (value) => _fio = value,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Пожалуйста, введите ваш email";
                            }
                            return null;
                          },
                          onSaved: (value) => _email = value,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Адрес доставки",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Пожалуйста, введите адрес доставки";
                            }
                            return null;
                          },
                          onSaved: (value) => _address = value,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Телефон",
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Пожалуйста, введите номер телефона";
                            }
                            return null;
                          },
                          onSaved: (value) => _phone = value,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Выберите способ оплаты:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _paymentMethod = "card";
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                _paymentMethod == "card" ? mainColor : Colors.grey[300],
                                foregroundColor: Colors.black,
                              ),
                              child: Text("Карта"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _paymentMethod = "cash";
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                _paymentMethod == "cash" ? mainColor : Colors.grey[300],
                                foregroundColor: Colors.black,
                              ),
                              child: Text("Наличные"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              if (_paymentMethod == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Пожалуйста, выберите способ оплаты")),
                                );
                              } else {
                                // Логика отправки данных на сервер
                                print("ФИО: $_fio");
                                print("Email: $_email");
                                print("Адрес: $_address");
                                print("Телефон: $_phone");
                                print("Способ оплаты: $_paymentMethod");
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            minimumSize: Size(double.infinity, 50),
                            foregroundColor: Colors.white,
                          ),
                          child: Text("Создать заказ"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}