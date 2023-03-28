import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5),
            height: 50,
            width: 300,
            child: TextFormField(
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Search here...'),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.camera_alt,
            size: 27,
            color: Color(0xFF4C53A5),
          )
        ],
      ),
    );
  }
}
