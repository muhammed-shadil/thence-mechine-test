import 'package:flutter/material.dart';

class AdWidget extends StatelessWidget {
  const AdWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 220, 238, 255),
              Color.fromARGB(255, 255, 230, 207)
            ],
          ),
        ), // Customize your ad or container here
        width: MediaQuery.of(context).size.width * 0.8,
        height: 100, // Fixed height for the ad container
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Free shipping",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Text(
                        "on orders",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w300),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 252, 198, 132),
                        ),
                        child: const Text(" over \$100 ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
            Image.asset(
              "assets/Saly-3.png",
              scale: 1.1,
            )
          ],
        ));
  }
}
