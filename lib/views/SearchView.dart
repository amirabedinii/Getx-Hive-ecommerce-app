import 'package:e_commercapp_getx_hive/contorollers/Usercontoroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constans.dart';
import '../models/flower/Flower.dart';

class searchView extends StatefulWidget {
  const searchView({Key? key}) : super(key: key);

  @override
  State<searchView> createState() => _searchViewState();
}

class _searchViewState extends State<searchView> {
  List<Flower> listofFlowers = listOfFlowersForSell;
  var userController = Get.find<Usercontoroller>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topLeft,
                  colors: [
                    Color.fromARGB(255, 212, 20, 90),
                    Color(0xFFFBB03B),
                  ],
                ),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                addAutomaticKeepAlives: true,
                physics: BouncingScrollPhysics(),
                itemCount: listofFlowers.length,
                itemBuilder: (context, index) {
                  return cartItem(listofFlowers[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 30,
                  width: 10,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget cartItem(Flower flower) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2E3192),
              Color(0xFF1BFFFF),
            ],
          ),
        ),
        width: size.width,
        height: size.height * 0.6,
        child: Stack(
          children: [
            Positioned(
              top: size.height * 0.01,
              right: size.width * 0.2,
              left: size.width * 0.2,
              child: Image.asset(
                "assets/images/images.jpeg",
              ),
            ),
            Positioned(
              top: size.height * 0.3,
              right: size.width * 0.07,
              child: RichText(
                overflow: TextOverflow.clip,
                softWrap: true,
                text: TextSpan(
                  text: "نام گیاه : ",
                  style: TextStyle(
                    fontSize: size.width * 0.07,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: flower.name,
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.35,
              right: size.width * 0.07,
              child: RichText(
                overflow: TextOverflow.clip,
                softWrap: true,
                text: TextSpan(
                  text: "قیمت : ",
                  style: TextStyle(
                    fontSize: size.width * 0.07,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: flower.price.toString() + " تومان",
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.41,
              right: size.width * 0.07,
              child: RichText(
                overflow: TextOverflow.clip,
                softWrap: true,
                text: TextSpan(
                  text: "توضیحات : ",
                  style: TextStyle(
                    fontSize: size.width * 0.07,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: flower.description.toString(),
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.5,
              right: size.width * 0.07,
              child: RaisedButton(
                elevation: 10,
                color: Color(0xFFFBCE3B),
                onPressed: () {
                  userController.addinthebag(flower);
                  print(userController.user.value.listOfInTheBag.length);
                  userController.update();
                },
                child: Text(
                  "افزودن به سبد خرید",
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
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