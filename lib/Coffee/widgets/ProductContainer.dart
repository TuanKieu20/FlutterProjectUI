import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Coffee/Screens/detail_screen.dart';
import 'package:flutter_projects/Coffee/bloc/coffee_bloc.dart';
import 'package:flutter_projects/Coffee/constant.dart';
import 'package:flutter_projects/Coffee/model/coffee_model.dart';
import 'package:flutter_projects/Coffee/widgets/TitleAndPrice.dart';
import 'package:flutter_projects/Dashbroad/Widgets/TextTK.dart';

class ProductContainer extends StatelessWidget {
  final CaffeeModel coffeeModel;
  final double width;
  final double height;
  final int index;
  final listItem;
  const ProductContainer({
    Key? key,
    required this.coffeeModel,
    required this.width,
    required this.height,
    required this.index,
    required this.listItem,
  }) : super(key: key);

  String get getRatingText {
    switch (coffeeModel.rating) {
      case 1:
        return "1.7";
      case 2:
        return "2.3";

      case 3:
        return "3.1";

      case 4:
        return "4.2";

      case 5:
        return "5.0";
      default:
        return "Unknow";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => DetailScreen(
                  model: coffeeModel,
                )),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            margin: (index == listItem.length - 1)
                ? EdgeInsets.only(right: 15)
                : EdgeInsets.only(left: 0),
            width: width, //size
            height: height, //size
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              width: width - 20, //size - 20
              height: height - 40, // size - 40
              decoration: BoxDecoration(
                color: ThemeColor.primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            right: -30,
            top: -20,
            child: Container(
              // color: Colors.red,
              height: height - 60, //size - 60
              width: width - 30, //size - 30
              child: Image(
                image: AssetImage(
                  coffeeModel.imgPath,
                ),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 40,
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                SizedBox(width: 5),
                TextTK(
                  text: getRatingText,
                  color: Colors.white,
                )
              ],
            ),
          ),
          Positioned(
            bottom: 5,
            left: 20,
            child: TitleAndPrice(
              width: width,
              coffeeModel: coffeeModel,
              listItem: listItem,
              onTap: () => BlocProvider.of<CoffeeBloc>(context).add(
                ChangeFavorit(coffeeModel.id, listItem),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class TitleAndPrice extends StatelessWidget {
//   const TitleAndPrice({
//     Key? key,
//     required this.width,
//     required this.coffeeModel,
//     required this.listItem,
//   }) : super(key: key);

//   final double width;
//   final coffeeModel;
//   final listItem;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width - 20,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               TextTK(text: coffeeModel.title, color: Colors.white),
//               SizedBox(height: 5),
//               TextTK(text: "\$${coffeeModel.price}", color: Colors.white),
//             ],
//           ),
//           InkWell(
//             onTap: () {
//               BlocProvider.of<CoffeeBloc>(context).add(
//                 ChangeFavorit(coffeeModel.id, listItem),
//               );
//             },
//             child: Container(
//               padding: const EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white,
//               ),
//               child: BlocBuilder<CoffeeBloc, CoffeeState>(
//                 builder: (context, state) {
//                   return Icon(
//                     coffeeModel.isFavorit
//                         ? Icons.favorite
//                         : Icons.favorite_border,
//                     color: Colors.red,
//                     size: 18,
//                   );
//                 },
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
