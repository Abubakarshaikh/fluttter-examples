class Coffee {
  final String name;
  final String pathImage;
  final double price;

  const Coffee(this.name, this.pathImage, this.price);

  static const coffeeList = [
    Coffee('Vietnamese Style Iced Coffee', 'images/coffee/img/9.png', 4.2),
    Coffee('Classic Irish Coffee', 'images/coffee/img/11.png', 4.3),
    Coffee('Americano', 'images/coffee/img/8.png', 3.3),
    Coffee('Caramel Macchiato', 'images/coffee/img/1.png', 3.2),
    Coffee('Toffee Nut Iced Latte', 'images/coffee/img/7.png', 4.0),
    Coffee('Caramelized Pecan Latte', 'images/coffee/img/4.png', 3.5),
    Coffee('Toffee Nut Latte', 'images/coffee/img/5.png', 3.9),
    Coffee('Iced Coffe Mocha', 'images/coffee/img/3.png', 3.2),
    Coffee('Capuchino', 'images/coffee/img/6.png', 3.1),
    Coffee('Caramel Cold Drink', 'images/coffee/img/2.png', 3.2),
    Coffee('Black Tea Latte', 'images/coffee/img/10.png', 4.3),
    Coffee('Toffee Nut Crunch Latte', 'images/coffee/img/12.png', 3.7),
  ];
}
