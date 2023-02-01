class Product {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Product(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}

class Catalog {
  final products = [
    Product(
        id: "001",
        name: "Amul Toned Milk",
        desc: "500ml",
        price: 30,
        color: "#33505a",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUFrU83Adg7xqXBhuJK5q012id8gx8OTd4AoJOh3ZOaKNlRg34GwYD8vqw4D_860e1YDM&usqp=CAU")
  ];
}
