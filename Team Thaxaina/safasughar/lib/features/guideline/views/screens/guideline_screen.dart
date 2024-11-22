import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/extensions/extension.dart';
import 'package:safasughar/features/guideline/views/widgets/guideline_tile.dart';
import 'package:safasughar/features/guideline/views/widgets/icon_container.dart';

class GuidelineScreen extends ConsumerStatefulWidget {
  const GuidelineScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GuidelineScreenState();
}

class _GuidelineScreenState extends ConsumerState<GuidelineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Guidelines",
        ),
        actions: appBarIcons,
      ),
      body: Container(
        // height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          border: Border.all(
            color: Colors.grey.shade400,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(
            18,
          ),
        ),
        child: const GuidelineTile(),
      ).onPadSym(5, 10),
    );
  }

  List<Widget> appBarIcons = [
    IconContainer(
      icon: IconlyLight.search,
      isSelected: false,
      isNotified: false,
      ontap: () {},
    ).onPadR(5),
    IconContainer(
      icon: IconlyLight.shieldDone,
      isSelected: true,
      isNotified: true,
      ontap: () {},
    ).onPadR(5),
  ];
}
