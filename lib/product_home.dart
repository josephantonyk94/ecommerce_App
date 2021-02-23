import 'package:dio/dio.dart';
import 'package:ecommercetestapp/model/product_response.dart';
import 'package:ecommercetestapp/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductHome extends StatefulWidget {
  final String token;

  ProductHome({this.token});

  @override
  _ProductHomeState createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int selectedIndex = 0;
 ProductResponse _productResponse;
  Services services = Services();
  @override
  void initState() {
    getProduct();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    super.initState();
  }
getProduct() async{
  _productResponse= await services.getProducts(widget.token);
  print(_productResponse.toString());
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Icon(
            Icons.list_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.person_pin,
            color: Colors.white,
          )
        ],
        backgroundColor: Color(0xff20639B),
        bottom: TabBar(
          tabs: [
            Tab(
              text: "ALL",
            ),
            Tab(
              text: "MALE",
            ),
            Tab(
              text: "FEMALE",
            ),
            Tab(
              text: "KIDS",
            ),
          ],
          unselectedLabelColor: Colors.white30,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          controller: _tabController,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
      backgroundColor: Colors.white70,
      body: TabBarView(
        children: [
          Container(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  width: 150,
                  child:
                      Column(children: [Image.network(""), Divider(), Row()]),
                );
              },
            ),
          ),
          Container(),
          Container(),
          Container()
        ],
        controller: _tabController,
      ),
    ));
  }
}
