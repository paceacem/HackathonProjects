import 'package:freezed_annotation/freezed_annotation.dart';

part 'guideline_model.freezed.dart';
part 'guideline_model.g.dart';

@freezed
class Guideline with _$Guideline {
  const factory Guideline({
    final String? title,
    final String? shortDescription,
    final String? longDescription,
    @Default(<String>[]) final List<String> imgUrls,
  }) = _Guideline;

  factory Guideline.fromJson(Map<String, dynamic> json) =>
      _$GuidelineFromJson(json);
}
