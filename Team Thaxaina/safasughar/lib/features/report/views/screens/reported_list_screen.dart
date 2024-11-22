import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/features/report/models/report_model.dart';
import 'package:safasughar/features/report/providers/reports_provider.dart';
import 'package:safasughar/features/report/views/screens/report_detail_screen.dart';
import 'package:safasughar/features/report/views/screens/report_issues_screen.dart';
import 'package:safasughar/features/report/views/widgets/custom_appbar.dart';
import 'package:safasughar/features/shared/views/widgets/button.dart';

class ReportedIssues extends StatelessWidget {
  const ReportedIssues({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const Column(
          children: [
            CustomAppBar(
              title: "Reported Issues",
              hideBackButton: true,
            ),
            Expanded(
              child: ReportedDumpingsList(), // Wrap ListView in Expanded
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ReportIssuesScreen(),
            ),
          );
        },
        child: const Icon(Icons.add,
            color: Colors.white), // Add icon to the floating action button
      ),
    );
  }
}

class ReportedDumpingsList extends ConsumerStatefulWidget {
  const ReportedDumpingsList({super.key});

  @override
  ConsumerState<ReportedDumpingsList> createState() =>
      _ReportedDumpingsListState();
}

class _ReportedDumpingsListState extends ConsumerState<ReportedDumpingsList> {
  @override
  Widget build(BuildContext context) {
    // Sample data for reported dumpings
    final reports = ref.watch(
      providerOfReports.select(
        (value) => value.reports,
      ),
    );

    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      itemCount: reports.length,
      itemBuilder: (context, index) {
        return DumpingReportCard(
          report: reports[index],
        );
      },
    );
  }
}

class DumpingReportCard extends StatelessWidget {
  final DumpingReport report;

  const DumpingReportCard({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReportDetailsScreen(report: report),
        ),
      ),
      child: Card(
        margin: const EdgeInsets.only(bottom: 12.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location
              Text(
                report.location,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 8.0),

              // Issue and Status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    report.issue,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[700],
                    ),
                  ),
                  _buildStatusChip(report.status),
                ],
              ),
              const SizedBox(height: 8.0),

              // Description
              Text(
                report.description,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color chipColor;
    switch (status) {
      case "Pending":
        chipColor = Colors.red;
        break;
      case "In Progress":
        chipColor = Colors.orange;
        break;
      case "Resolved":
        chipColor = Colors.green;
        break;
      default:
        chipColor = Colors.grey;
    }

    return AppButton.filled(
      value: status,
      color: chipColor,
      valueStyle: const TextStyle(
        color: Colors.white,
      ),
      borderRadius: 10.0,
      onPressed: () {},
    );
  }
}
