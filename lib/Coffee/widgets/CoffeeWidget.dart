import 'package:flutter/material.dart';
import 'package:flutter_projects/Coffee/widgets/ProductContainer.dart';
import 'package:flutter_projects/Dashbroad/Widgets/TextTK.dart';

class CoffeeWidget extends StatelessWidget {
  final listItem;
  const CoffeeWidget({Key? key, required this.listItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listItem.length,
              itemBuilder: (context, index) {
                return ProductContainer(
                  coffeeModel: listItem[index],
                  width: 230,
                  height: 280,
                  index: index,
                  listItem: listItem,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 20,
            ),
            child: TextTK(
              text: "Most Popular",
              size: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listItem.length,
              itemBuilder: (context, index) {
                return ProductContainer(
                  coffeeModel: listItem[index],
                  width: 230,
                  height: 200,
                  index: index,
                  listItem: listItem,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
