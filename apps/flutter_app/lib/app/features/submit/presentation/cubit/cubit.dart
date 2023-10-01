import 'package:file_picker/file_picker.dart';
import 'package:flutter_app/core/core.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

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
    final PdfDocument document = PdfDocument(
      inputBytes: result!.files.first.bytes,
    );
    final String content = PdfTextExtractor(document).extractText();
    document.dispose();
    emit(
      state.copyWith(
        pdfContent: content,
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
