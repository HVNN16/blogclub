import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../model/category_model.dart';
import '../api_service.dart';  

class CategorySlider extends StatefulWidget {
  const CategorySlider({super.key});

  @override
  State<CategorySlider> createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  final ApiService apiService = ApiService('https://api-blog-riin.onrender.com/categories'); // Provide the correct API URL
  List<Category> categories = []; // Store categories here
  bool isLoading = true; // Loading state for categories

  @override
  void initState() {
    super.initState();
    fetchCategories(); // Fetch categories when the widget is initialized
  }

  Future<void> fetchCategories() async {
    try {
      categories = await apiService.fetchCategories(); // Fetch categories from API
    } catch (error) {
      print("Error fetching categories: $error");
    } finally {
      setState(() {
        isLoading = false; // Update the loading state
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: isLoading
          ? const Center(child: CircularProgressIndicator()) // Show loading spinner while fetching
          : CarouselSlider.builder(
              itemCount: categories.length,
              itemBuilder: (context, index, realIndex) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          categories[index].imageFileName,
                          fit: BoxFit.cover, // Make sure the image fills the container
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 20,
                      child: Text(
                        categories[index].title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                aspectRatio: 1.2,
                viewportFraction: 0.8,
                padEnds: true,
                initialPage: 0,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                disableCenter: true,
              ),
            ),
    );
  }
}
