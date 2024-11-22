import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:safasughar/features/report/models/report_model.dart';

part 'reports_provider_state.freezed.dart';

@freezed
class ReportsProviderState with _$ReportsProviderState {
  const factory ReportsProviderState({
    @Default(<DumpingReport>[]) final List<DumpingReport> reports,
  }) = _ReportsProviderState;
}
