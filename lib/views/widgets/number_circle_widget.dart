import 'package:flutter/material.dart';

class NumberCircleWidget extends StatelessWidget {
  const NumberCircleWidget(
      {super.key, required this.label, this.isActive = false, this.onTap});
  final bool isActive;
  final String label;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? Theme.of(context).primaryColor : Colors.transparent,
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
              color: isActive ? Colors.white : Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
