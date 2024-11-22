import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/extensions/extension.dart';

class IconContainer extends ConsumerWidget {
  final IconData icon;
  final bool isSelected;
  final bool isNotified;
  final VoidCallback ontap;

  const IconContainer({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.isNotified,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      // alignment: Alignment.topRight,
      children: [
        _mainBody(),
        isNotified
            ? Positioned(top: 0, right: 0, child: _notificationComponent())
            : const SizedBox(),
      ],
    );
  }

  Widget _mainBody() {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.black : Colors.white,
        border: Border.all(
          color: isSelected ? Colors.black : Colors.grey.shade400,
          width: 1,
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          color: isSelected ? Colors.grey.shade200 : Colors.black,
        ),
      ),
    ).onTap(ontap);
  }

  Widget _notificationComponent() {
    return Container(
      height: 20,
      width: 20,
      decoration: const BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Text(
          "4",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
