import 'package:flutter/material.dart';

class ErrorLoadList extends StatelessWidget {
  const ErrorLoadList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.close_rounded, size: 60),
          const SizedBox(height: 12),
          Text(
            'Data Not Found',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
