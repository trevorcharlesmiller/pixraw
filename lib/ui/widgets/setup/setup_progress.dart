import 'package:flutter/material.dart';

const totalPages = 4;

class Pill extends StatelessWidget {
  final Color color;
  const Pill({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 40,
      height: 4,
      decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: color,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(2.0),
          )
    );
  }
}

class SetupProgress extends StatelessWidget {
  final int currentPage;
  const SetupProgress({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    List<Widget> children = [];

    for(int i = 0; i <= currentPage; i++) {
      children.add(Pill(color: Colors.blueAccent,));
    }
    for(int i = currentPage+1; i < totalPages; i++) {
      children.add(Pill(color: colorScheme.secondary,));
    }

    return SizedBox(
      height: 5,
      child: Row(
        spacing: 5,
        children: children,
        ),
    );
  }
}