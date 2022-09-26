import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:pk_practice/product.dart';

// import 'all_productModel.dart';
import 'category.dart';
import 'customAppbar.dart';
import 'product_in_detail_screen.dart';
import 'product_model.dart';

class allproductsScreen extends StatelessWidget {
  const allproductsScreen({super.key,required this.list});
  final List<Product> list;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //
    return Scaffold(
      appBar: PreferredSize(
          child: customAppbar(
            title: "ALL PRODUCTS",
            icon: IconlyBold.arrowLeft3,
            func1: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => categoryScreen()));
            },
            func2: () {
              Navigator.of(context).pop();
            },
          ),
          preferredSize: Size(double.infinity, size.height)),
      body: allproducts_listingScreen(list: list,),
    );
  }
}

class allproducts_listingScreen extends StatelessWidget {
  const allproducts_listingScreen({super.key,required this.list});
final List<Product> list;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: list.length,
      separatorBuilder: (context, index) => Divider(
        height: 3,
        color: Colors.red,
      ),
      itemBuilder: (context, index) {
        return allproduct_oneScreen(item: list[index]);
      },
    );
  }
}

class allproduct_oneScreen extends StatelessWidget {
  const allproduct_oneScreen({super.key, required this.item});
  final Product item;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Material(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => productDetail(item: item,)));
        },
          splashColor: Colors.purple,
          child: Container(
            width: double.infinity,
            // height: size.height * 0.54,
            height: size.height * 0.52,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                headers(price: item.price.toString()),
                middlePart(
                    title: item.title!,
                    img_list: [item.image, item.image, item.image]),
                footers(desc: item.description!)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class headers extends StatelessWidget {
  const headers({super.key, required this.price});
  final String price;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(right: 15, left: 0),
      // color: Colors.orange,
      width: double.infinity,
      height: size.height * 0.07,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, top: 10),
            height: size.height * 0.07,
            width: size.width * 0.27,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25))),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "\$",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.blue)),
              TextSpan(
                  text: price,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.blue)),
            ])),
          ),
          Icon(
            IconlyBold.discount,
            size: 40,
          ),
        ],
      ),
    );
  }
}

class middlePart extends StatelessWidget {
  const middlePart({super.key, required this.title, required this.img_list});
  final String title;
  final List img_list;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Swiper(
        autoplay: true,
        itemCount: img_list.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                  height: size.height * 0.4,
                  width: double.infinity,
                  child: Image.network(
                    img_list[index],
                    fit: BoxFit.fill,
                  )),
              title_on_top(main_title: title),
            ],
          );
        },
      ),
    );
  }
}

class footers extends StatelessWidget {
  const footers({super.key, required this.desc});
  final String desc;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(right: 15, left: 0),
      // color: Colors.orange,
      width: double.infinity,
      height: size.height * 0.055,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Text(
        desc,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class title_on_top extends StatelessWidget {
  const title_on_top({super.key, required this.main_title});
  final String main_title;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: size.height * 0.05,
            color: Colors.blue.withOpacity(.8),
            child: Text(
              main_title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            )),
      ),
    );
  }
}
