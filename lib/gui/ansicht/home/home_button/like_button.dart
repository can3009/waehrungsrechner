// like_button.dart

import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  final bool isLiked;
  final Function() onTap;

  const LikeButton({required this.isLiked, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 55,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.indigo[100],
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.indigo.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 100,
              offset: const Offset(2, 1),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            Icons.favorite,
            size: 30,
            color: isLiked ? Colors.red : Colors.grey,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
