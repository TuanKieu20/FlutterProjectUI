import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Coffee/bloc/coffee_bloc.dart';
import 'package:flutter_projects/Dashbroad/Widgets/TextTK.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key? key,
    required this.width,
    required this.coffeeModel,
    required this.listItem,
    required this.onTap,
  }) : super(key: key);

  final double width;
  final coffeeModel;
  final listItem;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width - 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextTK(text: coffeeModel.title, color: Colors.white),
              SizedBox(height: 5),
              TextTK(text: "\$${coffeeModel.price}", color: Colors.white),
            ],
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: BlocBuilder<CoffeeBloc, CoffeeState>(
                builder: (context, state) {
                  return Icon(
                    coffeeModel.isFavorit
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                    size: 18,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
