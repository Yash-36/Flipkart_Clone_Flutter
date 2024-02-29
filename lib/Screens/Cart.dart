import 'package:flipkart/Screens/Dashboard.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
          Theme.of(context).colorScheme.inversePrimary.withOpacity(0.2),
          title: Text("My Cart"),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("Flipkart"),
              ),
              Tab(
                child: Text("Gorcery"),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(children: [
                  Image.asset(
                    "lib/Assets/images/cart_empty_flipkart.jpg",
                    width: 200,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Missing Cart items?",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent),
                        shape: MaterialStateProperty.all(
                          ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30),
                        child: Text("Login",style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                        ),),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard(),),);
                  }, child: Text(
                    "Continue Shopping",
                    style: TextStyle(color: Colors.blueAccent.shade700),
                  ),)
                ])
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(children: [
                  Image.asset(
                    "lib/Assets/images/cart_empty_Grocery.jpg",
                    width: 200,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Your basket is empty!",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Enjoy upto 50% Savings on Grocery",
                    style: TextStyle(color: Colors.blueAccent.shade700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.blueAccent),
                        shape: MaterialStateProperty.all(
                          ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30),
                        child: Text("Shopping Now",style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        ),),
                      )),
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }
}
