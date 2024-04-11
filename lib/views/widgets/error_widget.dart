import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {super.key, required this.error, required this.onRefresh});
  final String error;
  final VoidCallback onRefresh;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Falha: $error',
            style: const TextStyle(
              fontSize: 24,
              color: Colors.red,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: onRefresh, child: const Text('Recarregar')))
        ],
      ),
    );
  }
}
