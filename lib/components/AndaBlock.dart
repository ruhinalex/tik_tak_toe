import 'package:flutter/material.dart';

class AndaBlock extends StatelessWidget {
  const AndaBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.5),
      child: const Icon(
        Icons.lens_outlined,
        size: 80.0,
        color: Colors.blue,
      ),
    );
  }
}
