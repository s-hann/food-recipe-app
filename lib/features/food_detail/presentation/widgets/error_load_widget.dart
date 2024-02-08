import 'package:flutter/material.dart';

class ErrorLoadWidget extends StatelessWidget {
  const ErrorLoadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
      ),
    );
  }
}
