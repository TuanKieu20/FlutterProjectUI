class CaffeeModel {
  final int id;
  final String title;
  final double price;
  final String imgPath;
  final int rating;
  bool isFavorit;
  CaffeeModel({
    required this.id,
    required this.title,
    required this.price,
    required this.imgPath,
    required this.rating,
    required this.isFavorit,
  });

  static List<CaffeeModel> listCoffe = [
    CaffeeModel(
      id: 1,
      title: "Coffee1 Latte",
      price: 30,
      imgPath: "assets/coffee/coffee1.png",
      rating: 4,
      isFavorit: true,
    ),
    CaffeeModel(
      id: 2,
      title: "Coffee2 Cup",
      price: 40,
      imgPath: "assets/coffee/coffee2.png",
      rating: 5,
      isFavorit: false,
    ),
    CaffeeModel(
      id: 3,
      title: "Coffee3 Drink",
      price: 20,
      imgPath: "assets/coffee/coffee1.png",
      rating: 3,
      isFavorit: false,
    ),
  ];

  static List<CaffeeModel> listTea = [
    CaffeeModel(
      id: 1,
      title: "Tea Latte",
      price: 20,
      imgPath: "assets/coffee/coffee2.png",
      rating: 2,
      isFavorit: true,
    ),
    CaffeeModel(
      id: 2,
      title: "Tea Cup",
      price: 15,
      imgPath: "assets/coffee/coffee1.png",
      rating: 3,
      isFavorit: false,
    ),
    CaffeeModel(
      id: 3,
      title: "Coffee3 Drink",
      price: 50,
      imgPath: "assets/coffee/coffee2.png",
      rating: 5,
      isFavorit: false,
    ),
  ];

  static List<CaffeeModel> listDrink = [
    CaffeeModel(
      id: 1,
      title: "Drink Latte",
      price: 30,
      imgPath: "assets/coffee/coffee1.png",
      rating: 4,
      isFavorit: true,
    ),
    CaffeeModel(
      id: 2,
      title: "Drink Cup",
      price: 40,
      imgPath: "assets/coffee/coffee1.png",
      rating: 5,
      isFavorit: false,
    ),
    CaffeeModel(
      id: 3,
      title: "Drink Drink",
      price: 20,
      imgPath: "assets/coffee/coffee2.png",
      rating: 3,
      isFavorit: false,
    ),
  ];
}
