import 'package:admin_portal/presentation/core/app_color.dart';
import 'package:flutter/material.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: AppColor.mainColor,
      strokeWidth: 8,
    );
  }
}