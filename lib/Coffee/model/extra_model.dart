class Extra {
  final int id;
  final String title;
  final double price;
  final imagePath;
  bool isEnable;
  Extra({
    required this.title,
    required this.price,
    required this.imagePath,
    required this.isEnable,
    required this.id,
  });
  static final listExtra = [
    Extra(
      id: 1,
      title: "Chocolate",
      price: 15,
      imagePath: "assets/extra/1380382581.svg",
      isEnable: true,
    ),
    Extra(
        id: 2,
        title: "Ice Cream",
        price: 10,
        imagePath: "assets/extra/birday-food.svg",
        isEnable: true),
    Extra(
        id: 3,
        title: "Pearl",
        price: 5,
        imagePath: "assets/extra/ChocolatLait.svg",
        isEnable: true),
    Extra(
        id: 4,
        title: "aloe vera",
        price: 20,
        imagePath: "assets/extra/green-tea.svg",
        isEnable: true),
  ];
}
