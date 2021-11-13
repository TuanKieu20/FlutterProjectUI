import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Coffee/Screens/cart_screen.dart';
import 'package:flutter_projects/Coffee/bloc/coffee_bloc.dart';
import 'package:flutter_projects/Coffee/constant.dart';
import 'package:flutter_projects/Coffee/model/coffee_model.dart';
import 'package:flutter_projects/Coffee/model/extra_model.dart';
import 'package:flutter_projects/Coffee/widgets/OutLineBottomBar.dart';
import 'package:flutter_projects/Coffee/widgets/OutLineButton.dart';
import 'package:flutter_projects/Dashbroad/Widgets/TextTK.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final CaffeeModel model;
  const DetailScreen({Key? key, required this.model}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Widget get getRating {
    switch (widget.model.rating) {
      case 1:
        return Row(
          children: [
            Icon(Icons.star, color: Colors.amber),
            Icon(Icons.star_outline, color: Colors.amber),
            Icon(Icons.star_outline, color: Colors.amber),
            Icon(Icons.star_outline, color: Colors.amber),
            Icon(Icons.star_outline, color: Colors.amber),
          ],
        );
      case 2:
        return Row(
          children: [
            Icon(Icons.star, color: Colors.amber),
            Icon(Icons.star, color: Colors.amber),
            Icon(Icons.star_outline, color: Colors.amber),
            Icon(Icons.star_outline, color: Colors.amber),
            Icon(Icons.star_outline, color: Colors.amber),
          ],
        );
      case 3:
        return Row(
          children: [
            Icon(Icons.star, color: Colors.amber),
            Icon(Icons.star, color: Colors.amber),
            Icon(Icons.star, color: Colors.amber),
            Icon(Icons.star_outline, color: Colors.amber),
            Icon(Icons.star_outline, color: Colors.amber),
          ],
        );
      case 4:
        return Row(
          children: [
            Icon(Icons.star, color: Colors.amber),
            Icon(Icons.star, color: Colors.amber),
            Icon(Icons.star, color: Colors.amber),
            Icon(Icons.star, color: Colors.amber),
            Icon(Icons.star_outline, color: Colors.amber),
          ],
        );
      case 5:
        return Row(
          children: [
            Icon(Icons.star, color: Colors.amber),
            Icon(Icons.star, color: Colors.amber),
            Icon(Icons.star, color: Colors.amber),
            Icon(Icons.star, color: Colors.amber),
            Icon(Icons.star, color: Colors.amber),
          ],
        );
      default:
        return Text("Unknow");
    }
  }

  String get getRatingText {
    switch (widget.model.rating) {
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
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ThemeColor.secondColor,
                Colors.grey,
              ],
              stops: [0.7, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        // BlocProvider.of<CoffeeBloc>(context).add(ClearState());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: ThemeColor.primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return CartScreen();
                        }));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: ThemeColor.primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: size.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.model.imgPath),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Container(
                // height: size.height * 0.6,
                // margin: const EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ), //left 25
                child: Column(
                  children: <Widget>[
                    Container(
                      padding:
                          const EdgeInsets.only(top: 20, left: 25, right: 25),
                      child: Row(
                        children: <Widget>[
                          TextTK(
                            text: widget.model.title,
                            fontWeight: FontWeight.w700,
                            size: 24,
                          ),
                          Spacer(),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ThemeColor.secondColor.withOpacity(0.2),
                            ),
                            child: Icon(
                              (widget.model.isFavorit == true)
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: Colors.red,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 25),
                      child: Row(
                        children: [
                          getRating,
                          SizedBox(width: 10),
                          TextTK(
                            text: getRatingText,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                          ),
                          SizedBox(width: 15),
                          TextTK(
                            text: "(70 reviews)",
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 5, left: 25, right: 20),
                      width: double.infinity,
                      child: TextTK(
                        maxLines: 5,
                        text:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rutrum magna neque, vitae ullamcorper ipsum aliquet sit amet. Suspendisse cursus dictum tincidunt. Quisque ultrices nec justo in eleifend. Sed eleifend, quam eu luctus maximus, libero erat lobortis mauris, nec placerat ex lorem luctus nibh. In fermentum ante et euismod rutrum",
                        overflow: TextOverflow.ellipsis,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 25),
                      child: TextTK(
                        text: "Add Extra",
                        fontWeight: FontWeight.w700,
                        size: 24,
                      ),
                    ),
                    Container(
                      // padding: const EdgeInsets.symmetric(vertical: 10),
                      margin: const EdgeInsets.only(bottom: 20),
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Extra.listExtra.length,
                        itemBuilder: (context, index) {
                          final _extras = Extra.listExtra;
                          return Container(
                            margin: (index == Extra.listExtra.length - 1)
                                ? const EdgeInsets.only(left: 25, right: 25)
                                : const EdgeInsets.only(left: 25),
                            width: 130,
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                      width: 130,
                                      height: 110,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      )),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 30,
                                  child: SvgPicture.asset(
                                    _extras[index].imagePath,
                                    alignment: Alignment.topRight,
                                    fit: BoxFit.scaleDown,
                                    width: 50,
                                    height: 80,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 5, bottom: 5),
                                    width: 100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextTK(
                                          text: _extras[index].title,
                                          size: 16,
                                        ),
                                        TextTK(
                                          text:
                                              "\$${_extras[index].price.toString()}",
                                          size: 16,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: BlocBuilder<CoffeeBloc, CoffeeState>(
                                    builder: (context, state) {
                                      // final _extras = state.extras;
                                      return Tooltip(
                                        message: "Click AddToCartto add",
                                        child: InkWell(
                                          onTap: (state.extras
                                                  .contains(_extras[index]))
                                              ? () {
                                                  print(
                                                      "Remove: ${_extras[index].title}}");
                                                  BlocProvider.of<CoffeeBloc>(
                                                          context)
                                                      .add(
                                                    RemoveExtra(
                                                      _extras[index],
                                                    ),
                                                  );
                                                }
                                              : () {
                                                  print(
                                                      "Add: ${_extras[index].title}}");
                                                  BlocProvider.of<CoffeeBloc>(
                                                          context)
                                                      .add(
                                                    AddExtra(
                                                      _extras[index],
                                                      widget.model,
                                                    ),
                                                  );
                                                },
                                          child: (state.extras
                                                  .contains(_extras[index]))
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors.white,
                                                    size: 16,
                                                  ),
                                                )
                                              : Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        ThemeColor.secondColor,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 16,
                                                  ),
                                                ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: OutLineBottomBar(
        child: Row(
          children: [
            Expanded(
              child: OutLineButton(
                color: ThemeColor.secondColor,
                child: TextButton(
                  onPressed: () {
                    BlocProvider.of<CoffeeBloc>(context).add(
                      AddToCart(widget.model),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor:
                            ThemeColor.secondColor.withOpacity(0.3),
                        content: Container(
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              // shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                            ),
                            child: TextTK(
                              text: " Add Success",
                              color: Colors.black,
                              size: 28,
                            ),
                          ),
                        ),
                        duration: Duration(
                          seconds: 5,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextTK(
                        text: "\$${widget.model.price}",
                        color: Colors.white,
                      ),
                      Container(
                        width: 3,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: OutLineButton(
                color: ThemeColor.primaryColor,
                child: TextButton(
                  onPressed: () {
                    launch("tel: 0385814308");
                  },
                  child: TextTK(
                    text: "Order Now",
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
