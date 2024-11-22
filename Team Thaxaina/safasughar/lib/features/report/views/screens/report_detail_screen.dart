import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safasughar/features/report/models/report_model.dart';

class ReportDetailsScreen extends StatelessWidget {
  final DumpingReport report;

  const ReportDetailsScreen({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          "Report Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontStyle: GoogleFonts.aBeeZee().fontStyle,
          ),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Location:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              report.location,
              style: const TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Issue:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              report.issue,
              style: const TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Description:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              report.description,
              style: const TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 16.0),
            if (report.imagePaths.isNotEmpty)
              const Text(
                "Images:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            const SizedBox(height: 8.0),
            if (report.imagePaths.isNotEmpty)
              Wrap(
                spacing: 8.0,
                children: report.imagePaths
                    .map((imagePath) => Image.file(
                          File(imagePath),
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}
