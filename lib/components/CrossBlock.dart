import 'package:flutter/material.dart';

class CrossBlock extends StatelessWidget {
  const CrossBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.5),
      child: const Icon(
        Icons.close_rounded,
        size: 80.0,
        color: Colors.redAccent,
      ),
    );
  }
}
