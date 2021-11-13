import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Coffee/model/coffee_model.dart';
import 'package:flutter_projects/Coffee/model/extra_model.dart';

part 'coffee_event.dart';
part 'coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  CoffeeBloc() : super(CoffeeState(extras: []));

  List<CaffeeModel> products = [];
  List<Extra> extras = [];

  @override
  Stream<CoffeeState> mapEventToState(CoffeeEvent event) async* {
    if (event is AddToCart) {
      if (!products.contains(event.product)) {
        products.add(event.product);
      }
      double total = 0.0;
      double totalExtra = 0.0;
      extras.forEach((extra) {
        totalExtra = totalExtra + extra.price;
      });
      products.forEach((pro) {
        total = (total + pro.price + totalExtra) * state.quality;
      });

      yield state.copyWith(
        products: products,
        total: total,
        lengthCart: products.length,
        totalProduct: totalExtra,
      );
    } else if (event is RemoveProduct) {
      products.removeAt(event.index);
      double total = 0.0;
      products.forEach((e) => total = total + e.price);
      yield state.copyWith(
        products: products,
        total: total,
      );
    } else if (event is ChangeFavorit) {
      yield state.copyWith(
        isFavorit: !state.isFavorit,
      );
      event.listItem.forEach(
        (e) {
          if (e.id == event.id) {
            e.isFavorit = state.isFavorit;
          }
        },
      );
    } else if (event is IncreaseQuantity) {
      yield state.copyWith(quality: state.quality + 1);
    } else if (event is DereaseQuantity) {
      if (state.quality > 1) {
        yield state.copyWith(quality: state.quality - 1);
      }
    } else if (event is ChangeIndex) {
      yield state.copyWith(index: event.index);
    } else if (event is AddExtra) {
      if (!extras.contains(event.extra)) {
        extras.add(event.extra);
      }
      yield state.copyWith(
        extras: extras,
      );
    } else if (event is RemoveExtra) {
      if (extras.contains(event.extra)) {
        extras.remove(event.extra);
      }
      double totalExtra = 0.0;
      extras.forEach((extra) {
        totalExtra = totalExtra + extra.price;
      });
      yield state.copyWith(
        extras: extras,
        totalProduct: totalExtra,
      );
    }
  }
}
