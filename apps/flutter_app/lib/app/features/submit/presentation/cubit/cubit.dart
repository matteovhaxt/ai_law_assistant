import 'package:file_picker/file_picker.dart';
import 'package:flutter_app/core/core.dart';

part 'cubit.g.dart';
part 'cubit.freezed.dart';

part 'state.dart';

class SubmitCubit extends Cubit<InputState> with HydratedMixin<InputState> {
  SubmitCubit(SubmitMethod method)
      : super(
          InputState(method: method),
        );

  Future<void> inputText(String text) async => emit(
        state.copyWith(
          text: text,
          isLoading: false,
        ),
      );

  Future<void> inputPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    emit(
      state.copyWith(
        pdfBytes: result?.files.single.bytes,
        isLoading: false,
      ),
    );
  }

  @override
  InputState? fromJson(Map<String, dynamic> json) {
    return InputState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(InputState state) {
    return state.toJson();
  }
}
