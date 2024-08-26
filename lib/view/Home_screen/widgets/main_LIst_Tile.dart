import 'package:flutter/material.dart';
import 'package:thence_mechine_test/model/data_model.dart';

class MainListTile extends StatelessWidget {
  const MainListTile({
    super.key,
    required this.fetcheddata,
    required this.index,
  });

  final Fetchdata fetcheddata;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 225, 251, 251),
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                ),
                width: MediaQuery.of(context).size.width * 0.25,
                child: Stack(
                  children: [
                    Image.network(
                        fit: BoxFit.cover, fetcheddata.data[index].imageUrl),
                    Positioned(
                      right: 8,
                      bottom: 8,
                      child: Container(
                        width: 20,
                        height: 23,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                          size: 15,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fetcheddata.data[index].name,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${fetcheddata.data[index].displaySize} ${fetcheddata.data[index].unit}",
                          style: const TextStyle(fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                    Text(
                      "${fetcheddata.data[index].price} ${fetcheddata.data[index].priceUnit}",
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(children: [
            const Icon(
              Icons.star_outlined,
              color: Colors.amber,
              size: 14,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                fetcheddata.data[index].rating.toString(),
                style: const TextStyle(color: Colors.amber),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
