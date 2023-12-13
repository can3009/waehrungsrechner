// like_button.dart

import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final bool isLiked;
  final Function() onTap;

  const LikeButton({required this.isLiked, required this.onTap});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isLiked = false;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });

    if (widget.onTap != null) {
      widget.onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 60,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.indigo[100],
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.indigo),
          boxShadow: [
            BoxShadow(
              color: Colors.indigo.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            _isLiked ? Icons.favorite : Icons.favorite_border,
            size: 35,
            color: _isLiked ? Colors.red : Colors.white,
          ),
        ),
      ),
      onTap: _toggleLike,
    );
  }
}

// decoration: BoxDecoration(
//                           color: Colors.indigo[100],
//                           borderRadius: BorderRadius.circular(15),
//                           border: Border.all(color: Colors.indigo),
//                         ),