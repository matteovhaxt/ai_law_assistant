part of 'cubit.dart';

enum SubmitMethod {
  text,
  pdf,
  camera,
}

@freezed
class InputState with _$InputState {
  const factory InputState({
    @Default(false) bool isLoading,
    SubmitMethod? method,
    String? text,
    String? pdfContent,
  }) = _InputState;

  factory InputState.fromJson(Map<String, dynamic> json) =>
      _$InputStateFromJson(json);
}
