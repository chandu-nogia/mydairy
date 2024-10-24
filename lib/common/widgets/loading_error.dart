import 'dart:developer';
import 'package:flutter/material.dart';
import '../../export.dart';

class LoadingdataScreen extends ConsumerWidget {
  final Widget Function(dynamic data) data;
  final AsyncValue<dynamic>? varBuild;
  const LoadingdataScreen({super.key, required this.data, this.varBuild});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errors = ref.watch(errorProvider);
    final internet = ref.watch(internetProvider);
    return varBuild!.when(
        // skipLoadingOnReload: true,
        // skipLoadingOnRefresh: true,
        error: (error, stackTrace) {
          log("::::Errors Provider :::  ::  :::  $error...$stackTrace");
          return errorMsg();
        },
        loading: () => Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  const CircularProgressIndicator(color: AppColor.appColor),
                  RSizedBox(height: 10.sp),
                  const Text("Loading...",
                      style: TextStyle(color: AppColor.appColor))
                ])),
        data: (snap) {
          if (snap != null) {
            return data(snap);
          } else if (snap.isEmpty || snap == []) {
            print("empty list");
            return emptyList();
          } else {
            if (internet == true) {
              return const Center(child: Text(Msg.noInternet));
            } else {
              return Center(
                  child: Text((errors.isNotEmpty) ? errors : Msg.somethingWrong,
                      style:
                          TextStyle(color: AppColor.redClr, fontSize: 14.sp)));
            }
          }
        });
  }
}

final internetProvider = StateProvider.autoDispose<bool?>((ref) => null);

Widget errorMsg() {
  return Center(
      child: Text(
    textAlign: TextAlign.center,
    Msg.sometechnicalissue,
    style: TextStyle(color: AppColor.appColor, fontSize: 14.sp),
  ));
}
