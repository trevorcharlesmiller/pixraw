import 'package:flutter/material.dart';

class RatingFilterButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback onTap;
  const RatingFilterButton({super.key, required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(24), // Matches circular style
      child: Padding(
        padding: EdgeInsets.all(12.0), // Matches standard IconButton padding feeling
        child: SizedBox(
          width: 24,
          height: 24,
          child: Stack(
            alignment: Alignment.center,
            children: [
              icon,
              Padding(
                padding: EdgeInsets.only(left: 3),
                  child: Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,), textAlign: TextAlign.center,)),
            ],
          ),
        ),
      ),
    );
  }
}
