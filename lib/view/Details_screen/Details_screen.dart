import 'package:flutter/material.dart';
import 'package:thence_mechine_test/model/data_model.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(
      {super.key, this.fetchdetails, this.index, this.productId});
  final Fetchdata? fetchdetails;
  final int? index;
  final String? productId;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    if (widget.productId != null) {
      // If a productId is provided, fetch the specific product details
      // Fetch data from your API or state management (Bloc)
      // Display a loading indicator while fetching data
      // Handle 404 if product is not found
    } else {
      // Existing code to display details from fetched data
      // Make sure to handle null checks properly
    }
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 230, 228, 228)),
              child: const Icon(
                Icons.favorite_border,
                size: 30,
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 50,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 176, 136, 136)),
                  child: const Center(
                    child: Text(
                      "Add to cart",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 238, 237, 237),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.network(
                widget.fetchdetails!.data[widget.index!].imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.fetchdetails!.data[widget.index!].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 28),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_outlined,
                            color: Colors.amber,
                            size: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Text(
                              widget.fetchdetails!.data[widget.index!].rating
                                  .toString(),
                              style: const TextStyle(color: Colors.amber),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    "${widget.fetchdetails!.data[widget.index!].price} ${widget.fetchdetails!.data[widget.index!].priceUnit}",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text("Choose size",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.fetchdetails!.data[widget.index!]
                          .availableSize.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedFilter = widget.fetchdetails!
                                    .data[widget.index!].availableSize[index]
                                    .toString();
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              decoration: BoxDecoration(
                                color: selectedFilter ==
                                        widget.fetchdetails!.data[widget.index!]
                                            .availableSize[index]
                                            .toString()
                                    ? const Color.fromARGB(255, 176, 136, 136)
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "${widget.fetchdetails!.data[widget.index!].availableSize[index]} ${widget.fetchdetails!.data[widget.index!].unit}",
                                  style: TextStyle(
                                    color: selectedFilter ==
                                            widget
                                                .fetchdetails!
                                                .data[widget.index!]
                                                .availableSize[index]
                                                .toString()
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Description",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    widget.fetchdetails!.data[widget.index!].description,
                    style: const TextStyle(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
