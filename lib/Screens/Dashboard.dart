import 'package:flipkart/Screens/Account.dart';
import 'package:flipkart/Screens/Cart.dart';
import 'package:flipkart/Screens/Categories.dart';
import 'package:flipkart/Screens/Home.dart';
import 'package:flipkart/Screens/Notifications.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;
  int selectedIndex = 0;
  List<Widget> Pages = [
    const Home(),
    const Categories(),
    const Notifications(),
    const Account(),
    const Cart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.black,
            ),
            activeIcon: Icon(Icons.home_outlined),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(Icons.category_outlined),
              label: "Categories"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(Icons.notifications_none_outlined),
              label: "Notifications"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(Icons.person_2_outlined),
              label: "Account"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(Icons.shopping_cart_outlined),
              label: "Cart"
          )
        ],
        currentIndex: selectedIndex,
        onTap:(value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}
