import 'package:animated_switch/animated_switch.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flipkart/Provider/cat_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent),
                        shape: MaterialStateProperty.all(
                          ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.flip),
                          Padding(padding: EdgeInsets.only(left: 10, right: 9)),
                          Text(
                            "Flipkart",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.white.withOpacity(0.5)),
                        shape: MaterialStateProperty.all(
                          ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.flip),
                          Padding(padding: EdgeInsets.only(left: 10, right: 9)),
                          Text(
                            "Grocery",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 1,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      flex: 0,
                      child: Column(
                        children: [
                          const Text(
                            "Brand Mall",
                            style: TextStyle(fontSize: 12),
                          ),
                          CupertinoSwitch(

                            value: _switchValue,
                            onChanged: (value) {
                              setState(() {
                                _switchValue = value;
                              });
                            },
                          ),
                          // SizedBox(height: 4,),
                          // AnimatedSwitch(
                          //   width: 30,
                          //   colorOff: CupertinoColors.systemGrey4,
                          //   value: _switchValue,
                          //   onChanged: (value) {
                          //     setState(() {
                          //       _switchValue = value;
                          //     });
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for products, brands and more',
                          hintStyle: TextStyle(fontSize: 15),
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Icon(Icons.mic),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 150.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 1,
                ),
                items: [
                  'lib/Assets/images/slider1.jpg',
                  'lib/Assets/images/slider2.jpg',
                  'lib/Assets/images/slider3.jpg',
                  'lib/Assets/images/slider4.jpg',
                  // Add more image URLs here as needed
                ].map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        // margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: railCategories.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 9, right: 9, bottom: 4),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      railCategories[index].catImageUrl,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return Image.asset(
                                              'lib/Assets/images/loadingImage.png');
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                railCategories[index].catName,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          );
                        },
                      ))
                ],
              ),
              Row(
                children: [buildcard(homeItems)],
              ),
              Row(
                children: [
                  Productcard("Electronic Product",electronicsItems)
                ],
              ),
              Row(
                children: [buildcard(furnitureItems)],
              ),
              Row(
                children: [
                  Productcard("Personal Use Product",personalCareItems)
                ],
              ),
              Row(
                children: [buildcard(toysAndBayItems)],
              ),
              Row(
                children: [
                  Productcard("fashionItems Product",fashionItems)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildcard(title) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 159,
      child: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Image.network(
                        title[index].catImageUrl,
                        width: 100,
                        height: 100,
                      ),
                      Text(
                        title[index].catName,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Up to 40% off",
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  )),
            );
          },
          itemCount: 3,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget Productcard(title,Itemname) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black, width: 0.03),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12,bottom: 12),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,style: TextStyle(
                      fontSize: 17,
                    ),),
                    Icon(Icons.chevron_right,color: Colors.blue,)
                  ],
                ),
              )
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 180,
              child: Container(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4,bottom: 5),
                      child: Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Image.network(
                                Itemname[index].catImageUrl,
                                width: 100,
                                height: 100,
                              ),
                              Text(
                                Itemname[index].catName,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Row(
                                children: [
                                  Text("920",style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    decoration: TextDecoration.lineThrough,
                                  ),),
                                  SizedBox(width: 10,),
                                  Text("₹648"),
                                ],
                              ),
                              Text(
                                "Up to 40% off",
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                      ),
                    );
                  },
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
