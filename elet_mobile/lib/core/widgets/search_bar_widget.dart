import 'package:flutter/material.dart';

class CustomSearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  const CustomSearchBarWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      width: MediaQuery.of(context).size.width,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: const Color.fromARGB(255, 185, 185, 185)),
      ),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search_rounded, color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          filled: true,
          fillColor: Colors.transparent,
          hintText: "Search",
          hintStyle: TextStyle(
            color: Color.fromARGB(148, 0, 0, 0),
            fontSize: 16,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
