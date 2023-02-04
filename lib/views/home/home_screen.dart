import 'package:flutter/material.dart';
import 'package:inkwell/views/home/widget/category_widget.dart';
import 'package:inkwell/views/home/widget/popular_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      children: const [
        Padding(
          padding: EdgeInsets.only(
            top: 24,
            bottom: 20,
          ),
          child: Text(
            "Let's Discover",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CategoryWidget(),
        SizedBox(
          height: 20,
        ),
        PopularWidget(),
        SizedBox(
          height: 20,
        ),
        PopularWidget(),
      ],
    );
  }
}
