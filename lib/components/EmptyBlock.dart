import 'package:flutter/material.dart';

class EmptyBlock extends StatelessWidget {
  const EmptyBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.5),
    );
  }
}
