part of 'coffee_bloc.dart';

class CoffeeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeIndex extends CoffeeEvent {
  final int index;
  ChangeIndex(this.index);
}

class AddToCart extends CoffeeEvent {
  final CaffeeModel product;
  AddToCart(this.product);
}

class RemoveProduct extends CoffeeEvent {
  final int index;
  RemoveProduct(this.index);
}

class ChangeFavorit extends CoffeeEvent {
  final int id;
  final listItem;
  ChangeFavorit(this.id, this.listItem);
}

class AddExtra extends CoffeeEvent {
  final Extra extra;
  final CaffeeModel coffeeMode;
  AddExtra(this.extra, this.coffeeMode);
  @override
  List<Object?> get props => [extra];
}

class RemoveExtra extends CoffeeEvent {
  final Extra extra;
  RemoveExtra(this.extra);
}

class IncreaseQuantity extends CoffeeEvent {}

class DereaseQuantity extends CoffeeEvent {}
