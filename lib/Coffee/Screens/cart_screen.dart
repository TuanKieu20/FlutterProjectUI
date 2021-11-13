import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Coffee/bloc/coffee_bloc.dart';
import 'package:flutter_projects/Coffee/constant.dart';
import 'package:flutter_projects/Coffee/widgets/OutLineBottomBar.dart';
import 'package:flutter_projects/Coffee/widgets/OutLineButton.dart';
import 'package:flutter_projects/Dashbroad/Widgets/TextTK.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cartBloc = BlocProvider.of<CoffeeBloc>(context);
    return BlocBuilder<CoffeeBloc, CoffeeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
          body: Container(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
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
                    SizedBox(
                      width: size.height * 0.13,
                    ),
                    TextTK(
                      text: "Cart  List",
                      fontWeight: FontWeight.bold,
                      size: 26,
                    )
                  ],
                ),
                (state.lengthCart == 0)
                    ? Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 100),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/coffee/cart_empty.png",
                              ),
                              SizedBox(height: 40),
                              TextTK(
                                text: "Cart is Empty",
                                color: Colors.red,
                                size: 28,
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: state.products!.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  width: size.width - 40,
                                  height: 180,
                                  color: Colors.transparent,
                                ),
                                Positioned(
                                  bottom: 45,
                                  child: Container(
                                    width: size.width - 40,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      color: ThemeColor.primaryColor,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  child: Container(
                                    width: size.width - 40,
                                    height: 180,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 80,
                                                bottom: 10,
                                                child: Container(
                                                  width: 100,
                                                  height: 50,
                                                  child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        state.extras.length,
                                                    itemBuilder: (context, i) {
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.white,
                                                        ),
                                                        width: 30,
                                                        height: 30,
                                                        margin: const EdgeInsets
                                                            .only(
                                                          left: 5,
                                                        ),
                                                        child: SvgPicture.asset(
                                                            state.extras[i]
                                                                .imagePath,
                                                            // "assets/extra/green-tea.svg",
                                                            fit: BoxFit
                                                                .scaleDown),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                child: Image.asset(
                                                  state
                                                      .products![index].imgPath,
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 35, horizontal: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextTK(
                                                  text: state
                                                      .products![index].title,
                                                  fontWeight: FontWeight.w500,
                                                  size: 22,
                                                  color: Colors.white,
                                                ),
                                                TextTK(
                                                  text:
                                                      "\$${(state.totalProduct + state.products![index].price)}",
                                                  fontWeight: FontWeight.w500,
                                                  size: 22,
                                                  color: Colors.white,
                                                ),
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        cartBloc.add(
                                                            IncreaseQuantity());
                                                      },
                                                      child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: ThemeColor
                                                                .secondColor,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: TextTK(
                                                            text: "+",
                                                            color: Colors.white,
                                                            size: 26,
                                                          )),
                                                    ),
                                                    SizedBox(width: 10),
                                                    TextTK(
                                                      text: "${state.quality}",
                                                      size: 21,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                    SizedBox(width: 10),
                                                    InkWell(
                                                      onTap: () {
                                                        cartBloc.add(
                                                            DereaseQuantity());
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ThemeColor
                                                              .secondColor,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: TextTK(
                                                          text: "-",
                                                          color: Colors.white,
                                                          size: 26,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
          bottomNavigationBar: OutLineBottomBar(
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: TextTK(
                      text: "\$${state.total}",
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.left,
                      size: 24,
                    )),
                Expanded(
                  flex: 3,
                  child: OutLineButton(
                    color: ThemeColor.primaryColor,
                    child: TextButton(
                      onPressed: () {},
                      child: TextTK(
                        text: "Buy Now",
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
      },
    );
  }
}
