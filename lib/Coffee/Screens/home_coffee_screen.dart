import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Coffee/Screens/cart_screen.dart';
import 'package:flutter_projects/Coffee/bloc/coffee_bloc.dart';
import 'package:flutter_projects/Coffee/constant.dart';
import 'package:flutter_projects/Coffee/model/coffee_model.dart';
import 'package:flutter_projects/Coffee/widgets/CoffeeWidget.dart';
import 'package:flutter_projects/Dashbroad/Widgets/TextTK.dart';

class HomeCoffeeScreen extends StatefulWidget {
  const HomeCoffeeScreen({Key? key}) : super(key: key);

  @override
  _HomeCoffeeScreenState createState() => _HomeCoffeeScreenState();
}

class _HomeCoffeeScreenState extends State<HomeCoffeeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(size: size),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _AppBar(),
                    SizedBox(height: 20),
                    _Title(),
                    SizedBox(height: 20),
                    _TitleTabBar(tabController: _tabController),
                  ],
                ),
              ),
              _BodyTabBar(tabController: _tabController),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BlocBuilder<CoffeeBloc, CoffeeState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                    color: ThemeColor.secondColor,
                    spreadRadius: 0,
                    blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: BottomNavigationBar(
                selectedItemColor: ThemeColor.primaryColor,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.shifting,
                unselectedFontSize: 12,
                iconSize: 32,
                selectedLabelStyle: TextStyle(fontSize: 14),
                showSelectedLabels: false,
                currentIndex: state.index,
                onTap: (index) => BlocProvider.of<CoffeeBloc>(context)
                    .add(ChangeIndex(index)),
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.grid_view), label: "Grid"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: "Search"),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_outline),
                    label: "Favorite",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    label: "Person",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _BodyTabBar extends StatelessWidget {
  const _BodyTabBar({
    Key? key,
    required TabController? tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          CoffeeWidget(listItem: CaffeeModel.listCoffe),
          CoffeeWidget(listItem: CaffeeModel.listTea),
          CoffeeWidget(listItem: CaffeeModel.listDrink),
        ],
      ),
    );
  }
}

class _TitleTabBar extends StatelessWidget {
  const _TitleTabBar({
    Key? key,
    required TabController? tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      indicatorColor: Colors.transparent,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white38,
      labelPadding: EdgeInsets.symmetric(horizontal: 18.0),
      isScrollable: true,
      tabs: [
        Tab(
          child: Text(
            'Coffee',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Tab(
          child: Text(
            'Tea',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Tab(
          child: Text(
            'Drink',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextTK(
        text: "Best Coffee in Town",
        size: 26,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.segment,
            color: Colors.white,
            size: 28,
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 28,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return CartScreen();
            }));
          },
          icon: Icon(
            Icons.shopping_cart,
            size: 28,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: size.height * 0.5,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            ThemeColor.secondColor.withOpacity(0.6),
            ThemeColor.secondColor,
          ], begin: Alignment.topRight, end: Alignment.centerLeft),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
