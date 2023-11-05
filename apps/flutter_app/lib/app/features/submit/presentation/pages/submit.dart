import 'package:flutter/material.dart';
import 'package:flutter_app/core/core.dart';

import '../../submit.dart';

class SubmitScreen extends StatelessWidget {
  const SubmitScreen._();

  static Page page() => MaterialPage(
        child: BlocProvider(
          create: (context) => SubmitCubit(),
          child: const SubmitScreen._(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight:
                context.mediaQuery.size.height * (context.isDesktop ? .5 : .8),
            maxWidth:
                context.mediaQuery.size.width * (context.isDesktop ? .5 : .8),
          ),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(context.padding.extraBig),
              child: Builder(
                builder: (context) {
                  final cubit = context.watch<SubmitCubit>();
                  if (cubit.state.isMakingRequest) {
                    return UIColumn.gap(
                      context.padding.medium,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        Text(
                          'submit.analysis_in_progress'.tr(),
                        ),
                      ],
                    );
                  }
                  return UIColumn.gap(
                    context.padding.medium,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Flexible(
                        child: OutlinedButton(
                          onPressed: () async => cubit.inputPdf(),
                          child: UIColumn.gap(
                            context.padding.medium,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (cubit.state.isPickingPdf) ...[
                                const CircularProgressIndicator(),
                              ] else ...[
                                Icon(
                                  cubit.state.pdfIsSubmittable
                                      ? Icons.file_upload
                                      : Icons.file_open,
                                ),
                                Text(
                                  cubit.state.pdfIsSubmittable
                                      ? cubit.state.pdfName!
                                      : 'submit.choose_file'.tr(),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                      UIPrimaryButton(
                        title: 'submit.send'.tr(),
                        isLoading: cubit.state.isUploadingToStorage,
                        isDisabled: cubit.state.pdfIsSubmittable == false,
                        trailing: const Icon(
                          Icons.send,
                        ),
                        onPressed: () => cubit.submitPdf(context),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
