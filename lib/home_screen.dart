import 'package:flutter/material.dart';
import 'widgets/location_card.dart';
import 'widgets/recommended_cards.dart';
import 'widgets/most_viewed_hotels.dart';
import 'widgets/advertisement_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  List<Map<String, String>> locations = [
    {
      'imageUrl': 'https://www.holidify.com/images/bgImages/KEDARNATH.jpg',
      'locationName': 'India'
    },
    {
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1dunVls4eO2Z7dLWIEDWFjpxleH3b8qvdWQ&s',
      'locationName': 'Moscow'
    },
    {
      'imageUrl': 'https://www.m-jglobal.com/wp-content/uploads/2023/03/Tourist-Attractions-in-the-USA_-Best-Places-to-Visit-1.png',
      'locationName': 'USA'
    },
  ];

  List<Map<String, String>> recommendedHotels = [
    {
      'imageUrl': 'https://www.samskararesorts.com/images/slide5.jpg',
      'price': '120',
      'description': 'Carinthia Lake see Breakfast',
      'rating': '4',
    },
    {
      'imageUrl': 'https://cdn.sanity.io/images/ocl5w36p/production/14a41ba864d45957d4ed8c42414e59dd94df160a-640x880.png?w=480&fm=webp&dpr=2',
      'price': '400',
      'description': 'Carinthia Lake see Breakfast',
      'rating': '5',
    },
  ];

  List<Map<String, String>> mostViewedHotels = [
    {
      'imageUrl': 'https://www.samskararesorts.com/images/slide5.jpg',
      'price': '120',
      'description': 'Carinthia Lake see Breakfast',
      'rating': '4',
    },
    {
      'imageUrl': 'https://cdn.sanity.io/images/ocl5w36p/production/14a41ba864d45957d4ed8c42414e59dd94df160a-640x880.png?w=480&fm=webp&dpr=2',
      'price': '400',
      'description': 'Carinthia Lake see Breakfast',
      'rating': '5',
    },
    {
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgFu6OyIljjNVgE3h9uPrAthGvUxQ2FgYm5Q&s',
      'price': '300',
      'description': 'Carinthia Lake see Breakfast',
      'rating': '5',
    },
  ];

  List<Map<String, String>> get filteredLocations {
    if (_searchQuery.isEmpty) {
      return locations;
    } else {
      return locations.where((location) =>
          location['locationName']!
              .toLowerCase()
              .contains(_searchQuery.toLowerCase())).toList();
    }
  }

  void _onFilterPressed() {
    // Implement your filter functionality here
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top section with light gray background
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      'Explore the world! By Travelling',
                      style: TextStyle(
                        fontSize: screenWidth * 0.085,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                onChanged: (value) {
                                  _searchQuery = value;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Where did you go?',
                                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.vertical_distribute, color: Colors.grey),
                                onPressed: _onFilterPressed,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Content section with white background
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.03),
                     Text(
                      'Popular locations',
                      style: TextStyle(
                         fontSize: screenWidth * 0.065,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    SizedBox(
                      height: screenHeight * 0.2,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: filteredLocations.map((location) {
                          return LocationCard(
                            imageUrl: location['imageUrl']!,
                            locationName: location['locationName']!,
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                     Text(
                      'Recommended',
                      style: TextStyle(
                         fontSize: screenWidth * 0.065,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: recommendedHotels.map((hotel) {
                          return Padding(
                            padding: EdgeInsets.only(right: screenWidth * 0.02),
                            child: RecommendedCard(
                              imageUrl: hotel['imageUrl']!,
                              price: double.parse(hotel['price']!),
                              description: hotel['description']!,
                              rating: int.parse(hotel['rating']!),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    AdvertisementCard(
                      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvYv4bJH62KZEjKyo04sAFzDd-WZwrP46R6A&s',
                      title: 'Hosting Fee for\nas low as 1%',
                      buttonText: 'Become a Host',
                      onPressed: () {},
                    ),
                    SizedBox(height: screenHeight * 0.03),
                     Text(
                      'Most Viewed',
                      style: TextStyle(
                        fontSize: screenWidth * 0.065,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: mostViewedHotels.map((hotel) {
                        return MostViewedHotelCard(
                          imageUrl: hotel['imageUrl']!,
                          price: double.parse(hotel['price']!),
                          description: hotel['description']!,
                          rating: int.parse(hotel['rating']!),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
