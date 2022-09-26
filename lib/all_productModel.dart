class allProductModel {
  final String title;
  final String price;
  final String img1;
  final String img2;
  final String img3;
  final String desc;
  final String desc2;

  allProductModel(
      {required this.title,
      required this.price,
      required this.img1,
      required this.img2,
      required this.img3,
      required this.desc,
      required this.desc2});
}

List<allProductModel> allproductList = [
  allProductModel(
      title: "Sneakers",
      price: "42.20",
      img1: "assets/images/sneaker1.jpg",
      img2: "assets/images/sneaker2.jpg",
      img3: "assets/images/sneaker3.jpg",
      desc: "Crocs Men's Literide 360 Pacer Sneakers",
      desc2:
          "evolution of LiteRide, the plush LiteRide foam footbed delivers support and cushioning where your feet need it most. The Matlite Motion straps mimic the flexibility of a knit fabric,"),
  allProductModel(
      title: "Hoodies",
      price: "899",
      img1: "assets/images/hoody1.jpg",
      img2: "assets/images/hoody2.jpg",
      img3: "assets/images/hoody3.jpg",
      desc: "Nope Not Today Fleece Hoodie For Men",
      desc2:
          "High quality fleece material, machine or hand washable,100% pure, Export quality stitching and material."),
  allProductModel(
      title: "Furniture",
      price: "1992",
      img1: "assets/images/fur1.jpg",
      img2: "assets/images/fur2.jpg",
      img3: "assets/images/fur3.jpg",
      desc: "Luxe lounging with sets of sofa",
      desc2:
          "Create a relaxing retreat anywhere in your home for reading, working and entertaining"),
  allProductModel(
      title: "Watches",
      price: "49.92",
      img1: "assets/images/watch1.jpg",
      img2: "assets/images/watch2.jpg",
      img3: "assets/images/watch3.jpg",
      desc: "Casio Men 200 M WR Black Dive Watch",
      desc2:
          "200 M Water Resistance. Mineral Glass. Diver inspired Rotating bezel with anti reverse, Screw down crown"),
  allProductModel(
      title: "Sunglasses",
      price: "1254",
      img1: "assets/images/glass1.jpg",
      img2: "assets/images/glass2.jpg",
      img3: "assets/images/glass3.jpg",
      desc: "Polarized Sunglasses UV Protection",
      desc2:
          "UV400 PROTECTION: 100% UV400 protective for this sports sunglasses. Which is good for keeping lens clear. In daily use, our glasses can provide a more enjoyable cycling experience."),
  allProductModel(
      title: "Caps",
      price: "24.92",
      img1: "assets/images/cap1.jpg",
      img2: "assets/images/cap2.jpg",
      img3: "assets/images/cap3.jpg",
      desc: "Nike Men's Unisex Legacy91 Tech Hat",
      desc2:
          "Dri-FIT technology helps you stay dry and comfortable. Back strap metal buckle closure to adjust your fit. Embroidered eyelets"),
];
