import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/demo_data.dart';
import 'package:safasughar/features/guideline_v2/views/widgets/guidelines_list_item.dart';

class GuidelinesList extends ConsumerStatefulWidget {
  const GuidelinesList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GuidelinesListState();
}

class _GuidelinesListState extends ConsumerState<GuidelinesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: wasteManagementGuidelines.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final guideline = wasteManagementGuidelines[index];
        return GuidelinesListItem(
          guideline: guideline,
        );
      },
    );
  }
}
