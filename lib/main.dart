import 'package:admin_portal/app.dart';
import 'package:admin_portal/service_locator.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await startup();
  runApp(const AdminPortalApp());
}
