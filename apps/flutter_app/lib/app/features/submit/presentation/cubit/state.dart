part of 'cubit.dart';

@freezed
class InputState with _$InputState {
  const factory InputState({
    @Default(false) bool isPickingPdf,
    @Default(false) bool isUploadingToStorage,
    @Default(false) bool isMakingRequest,
    String? text,
    String? pdfName,
    List<int>? pdfData,
    String? pdfUrl,
  }) = _InputState;

  factory InputState.fromJson(Map<String, dynamic> json) =>
      _$InputStateFromJson(json);
}

extension InputStateX on InputState {
  bool get pdfIsSubmittable => pdfData != null && pdfName != null;
}
