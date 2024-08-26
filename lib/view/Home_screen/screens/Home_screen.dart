import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thence_mechine_test/view/Details_screen/Details_screen.dart';
import 'package:thence_mechine_test/controller/bloc/fetch_data_bloc.dart';
import 'package:thence_mechine_test/model/data_model.dart';
import 'package:thence_mechine_test/view/Home_screen/widgets/ad_widget.dart';
import 'package:thence_mechine_test/view/Home_screen/widgets/main_LIst_Tile.dart';
import 'package:thence_mechine_test/view/Home_screen/widgets/shimmer.dart';

class HomescreenWrapper extends StatelessWidget {
  const HomescreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchDataBloc(),
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> filterOptions = [
    'All',
    'Succulents',
    'In Pots',
    'Dried Flowers',
    'Hanging Plants'
  ];
  String selectedFilter = 'All';

  @override
  void initState() {
    BlocProvider.of<FetchDataBloc>(context).add(Fetchplantslist());
    super.initState();
  }

  late Fetchdata fetcheddata;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "All plants",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          actions: const [Icon(Icons.search)],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Houseplants",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Horizontal filter list
              SizedBox(
                height: 40, // Fixed height for the filter list
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filterOptions.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filterOptions[index];
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: selectedFilter == filterOptions[index]
                                ? const Color.fromARGB(255, 176, 136, 136)
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            filterOptions[index],
                            style: TextStyle(
                              color: selectedFilter == filterOptions[index]
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 12), // Space between filter and list view

              // Main list view to fill remaining space
              BlocBuilder<FetchDataBloc, FetchDataState>(
                  builder: (context, state) {
                if (state is successfetch) {
                  return Expanded(
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: state.data.data
                          .length, // Adjust the count to accommodate ads.
                      itemBuilder: (BuildContext context, int index) {
                        // Every 4th position, starting from index 3 (0-based index)

                        fetcheddata = state.data;
                        if (index != 0 && (index + 1) % 3 == 0) {
                          return AdWidget();
                        }
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DetailsScreen(
                                          fetchdetails: fetcheddata,
                                          index: index,
                                        )));
                          },
                          child: MainListTile(
                            fetcheddata: fetcheddata,
                            index: index,
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is loadingfetch) {
                  return const ShimmerLoading();
                } else if (state is failurefetch) {
                  Text(state.message!);
                }
                return Container();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
