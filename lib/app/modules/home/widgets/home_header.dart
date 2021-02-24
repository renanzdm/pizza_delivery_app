import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return SizedBox(
        height: 350,
        child: Stack(
          children: [
            Container(
              height: 300,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.none,
                  image: AssetImage('assets/images/topoCardapio.png'),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              width: constraints.maxWidth,
              child: SizedBox(
                height: 200,
                child: Image.asset('assets/images/logo.png'),
              ),
            )
          ],
        ),
      );
    });
  }
}
