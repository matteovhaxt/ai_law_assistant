import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/core/core.dart';

part 'cubit.g.dart';
part 'cubit.freezed.dart';

part 'state.dart';

class SubmitCubit extends Cubit<InputState> with HydratedMixin<InputState> {
  SubmitCubit()
      : super(
          const InputState(),
        );

  Future<void> inputPdf() async {
    emit(
      state.copyWith(
        isPickingPdf: true,
      ),
    );
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      emit(
        state.copyWith(
          isPickingPdf: false,
          pdfName: result?.files.first.name,
          pdfData: result?.files.first.bytes,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isPickingPdf: false,
        ),
      );
    }
  }

  Future<void> submitPdf(BuildContext context) async {
    await uploadPdf(context);
    if (state.pdfUrl == null) throw UnimplementedError();
    await getSummary(context);
  }

  Future<void> uploadPdf(BuildContext context) async {
    emit(
      state.copyWith(
        isUploadingToStorage: true,
      ),
    );
    try {
      if (state.pdfData == null || state.pdfName == null) throw Exception();
      final storageRef = FirebaseStorage.instance.ref();
      final pdfRef = storageRef.child(
        'users/${context.user!.uid}/pdfs/${state.pdfName}',
      );
      final upload = await pdfRef.putData(
        Uint8List.fromList(
          state.pdfData!,
        ),
        SettableMetadata(
          contentType: 'application/pdf',
        ),
      );
      final url = await upload.ref.getDownloadURL();
      emit(
        state.copyWith(
          isUploadingToStorage: false,
          pdfUrl: url,
        ),
      );
    } catch (e) {
      context.logger.e(e);
      emit(
        state.copyWith(
          isUploadingToStorage: false,
        ),
      );
    }
  }

  Future<void> getSummary(BuildContext context) async {
    emit(
      state.copyWith(
        isMakingRequest: true,
      ),
    );
    try {
      final dio = Dio();
      final response = await dio.post(
        'https://get-summary-5ypzlk4z6q-ey.a.run.app',
        data: {
          'pdfUrl': state.pdfUrl,
        },
        options: Options(
          headers: {
            'Access-Control-Allow-Origin': 'Accept',
          },
        ),
      );
      emit(
        state.copyWith(
          isMakingRequest: false,
        ),
      );
      context.go('chat');
    } catch (e) {
      context.logger.e(e);
      emit(
        state.copyWith(
          isMakingRequest: false,
        ),
      );
    }
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
