import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/demo_data.dart';
import 'package:safasughar/features/report/models/report_model.dart';
import 'package:safasughar/features/report/providers/states/reports_provider_state.dart';

final providerOfReports =
    StateNotifierProvider<ReportsProvider, ReportsProviderState>(
  (ref) => ReportsProvider(
    state: const ReportsProviderState(),
  ),
);

class ReportsProvider extends StateNotifier<ReportsProviderState> {
  ReportsProvider({
    required final ReportsProviderState state,
  }) : super(state) {
    updateReports(reports);
  }

  void addToReports(final DumpingReport report) {
    updateReports([...state.reports, report]);
  }

  void updateReports(final List<DumpingReport> reports) {
    state = state.copyWith(
      reports: reports,
    );
  }
}
