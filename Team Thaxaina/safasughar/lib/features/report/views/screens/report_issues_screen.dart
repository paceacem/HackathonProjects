import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/features/report/models/report_model.dart';
import 'package:safasughar/features/report/providers/reports_provider.dart';
import 'package:safasughar/features/report/views/widgets/custom_appbar.dart';
import 'package:safasughar/features/report/views/widgets/multi_image_picker.dart';

class ReportIssuesScreen extends ConsumerStatefulWidget {
  const ReportIssuesScreen({super.key});

  @override
  ConsumerState<ReportIssuesScreen> createState() => _ReportIssuesScreenState();
}

class _ReportIssuesScreenState extends ConsumerState<ReportIssuesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: const Column(
          children: [
            CustomAppBar(
              title: "Report Issues",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: ReportWasteDumpForm(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReportWasteDumpForm extends ConsumerStatefulWidget {
  const ReportWasteDumpForm({super.key});

  @override
  ConsumerState<ReportWasteDumpForm> createState() =>
      _ReportWasteDumpFormState();
}

class _ReportWasteDumpFormState extends ConsumerState<ReportWasteDumpForm> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  String? _selectedIssue;
  List<File> _selectedImages = [];

  final List<String> _issues = [
    'Illegal dumping',
    'Overflowing bin',
    'Hazardous waste',
    'Other',
  ];

  @override
  void dispose() {
    _locationController.dispose();
    _commentsController.dispose();
    super.dispose();
  }

  void _handleImagesSelected(List<File> images) {
    setState(() {
      _selectedImages = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "We will help you as soon as you report the issue below.",
          style: TextStyle(
            fontSize: 16.0,
            fontStyle: GoogleFonts.aBeeZee().fontStyle,
          ),
        ),
        const SizedBox(height: 16.0),

        //---------------------------------Location---------------------------------
        Text(
          "Location :",
          style: GoogleFonts.aBeeZee(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        _locationInput(),

        const SizedBox(height: 16.0),

        //---------------------------------Add Photo---------------------------------
        MultiImagePicker(onImagesSelected: _handleImagesSelected),

        const SizedBox(height: 16.0),

        _selectIssue(),

        const SizedBox(height: 16.0),

        _addDescription(),

        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _submitButton(),
          ],
        ),

        const SizedBox(height: 16.0),
      ],
    );
  }

  //------- location input-------
  Widget _locationInput() {
    return TextField(
      controller: _locationController,
      decoration: InputDecoration(
        hintText: "Enter the location",
        hintStyle: TextStyle(
          fontSize: 14,
          fontStyle: GoogleFonts.aBeeZee().fontStyle,
          color: Colors.black38,
        ),
        suffixIcon: const Icon(Icons.location_pin),
        border: const OutlineInputBorder(),
      ),
    );
  }

  //---------------------------------Select Issue---------------------------------
  Widget _selectIssue() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select issue :",
          style: GoogleFonts.aBeeZee(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Wrap(
          spacing: 8.0,
          children: _issues
              .map((issue) => ChoiceChip(
                    label: Text(issue),
                    selected: _selectedIssue == issue,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedIssue = selected ? issue : null;
                      });
                    },
                  ))
              .toList(),
        ),
      ],
    );
  }

  //---------------------------------Description---------------------------------
  Widget _addDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description :",
          style: GoogleFonts.aBeeZee(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        TextField(
          controller: _commentsController,
          maxLength: 500,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: "Describe the problem in more detail...",
            hintStyle: GoogleFonts.aBeeZee(
              fontSize: 14,
              color: Colors.black38,
            ),
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  //-------Submit Button-------
  Widget _submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      ),
      onPressed: () {
        if (_locationController.text.isNotEmpty && _selectedIssue != null) {
          // Create a report
          final report = DumpingReport(
            location: _locationController.text,
            issue: _selectedIssue!,
            description: _commentsController.text,
            imagePaths: _selectedImages.map((file) => file.path).toList(),
          );

          //add new report to the global report
          ref.read(providerOfReports.notifier).addToReports(report);

          // Navigate to the Reported Issues list Screen
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please fill all required fields.")),
          );
        }
      },
      child: Text(
        "Submit",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontStyle: GoogleFonts.aBeeZee().fontStyle,
        ),
      ),
    );
  }
}
