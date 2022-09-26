import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

// class customAppbar extends StatelessWidget {
//   const customAppbar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//         child: customWork(),
//         preferredSize:
//             Size(double.infinity, MediaQuery.of(context).size.height));
//   }
// }

class customAppbar extends StatelessWidget {
  const customAppbar({super.key, required this.title, required this.icon,this.func1,this.func2});
  final String title;
  final IconData icon;
  final Function()? func1;
  final Function()? func2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.black,
            Colors.white12,
            Colors.black,
          ]),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 5,
              spreadRadius: 5,
              color: Colors.red,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customIcon(func: func1, icon: IconlyBold.category),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25),
            ),
            customIcon(func: func2, icon: icon),
          ],
        ),
      ),
    );
  }
}

class customIcon extends StatelessWidget {
  const customIcon({super.key, required this.func, required this.icon});
  final IconData icon;
  final Function()? func;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        padding: EdgeInsets.all(5),
        child: Icon(
          icon,
          size: 30,
          color: Colors.red,
        ),
      ),
    );
  }
}
