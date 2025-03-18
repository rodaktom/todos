import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TodoListItemShimmer extends StatelessWidget {
  const TodoListItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black38,
      highlightColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            Expanded(child: Container(height: 50.0, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
