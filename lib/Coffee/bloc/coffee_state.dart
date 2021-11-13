part of 'coffee_bloc.dart';

class CoffeeState extends Equatable {
  final int index;
  final bool isFavorit;
  final List<CaffeeModel>? products;
  final int quality;
  final double price;
  final double total;
  final double totalProduct;
  final List<Extra> extras;
  final int lengthCart;
  CoffeeState({
    this.index = 0,
    this.isFavorit = true,
    this.price = 0.0,
    this.quality = 1,
    this.total = 0.0,
    this.products,
    required this.extras,
    this.lengthCart = 0,
    this.totalProduct = 0.0,
  });

  CoffeeState copyWith({
    int? index,
    bool? isFavorit,
    double? price,
    int? quality,
    double? total,
    double? totalProduct,
    bool? isEnable,
    List<CaffeeModel>? products,
    List<Extra>? extras,
    int? lengthCart,
  }) {
    return CoffeeState(
      index: index ?? this.index,
      isFavorit: isFavorit ?? this.isFavorit,
      price: price ?? this.price,
      quality: quality ?? this.quality,
      total: total ?? this.total,
      products: products ?? this.products,
      extras: extras ?? this.extras,
      lengthCart: lengthCart ?? this.lengthCart,
      totalProduct: totalProduct ?? this.totalProduct,
    );
  }

  @override
  List<Object?> get props =>
      [index, isFavorit, products, quality, price, total, extras];
}
