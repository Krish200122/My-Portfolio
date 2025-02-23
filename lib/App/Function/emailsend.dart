// ignore_for_file: camel_case_types, avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class emailservice {
  static Future<bool> sendemail(
      {required String name,
      required String email,
      required String message}) async {
    var endpoint = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    var response = await http.post(endpoint,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'service_id': 'service_co42jyb',
          'template_id': 'template_mb9n9ht',
          'user_id': 'kDW4dwb3ffTU-vNW2',
          'template_params': {
            'user_name': name,
            'user_email': email,
            'user_message': message,
          }
        }));
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception();
    }
  }

  static Future<void> downloadPdf(String type) async {
    try {
      if (type == "Cloud") {
        Directory? downloadsDir = await getExternalStorageDirectory();
        String savePath = "${downloadsDir!.path}/KrishResume.pdf";

        // Load PDF from assets
        ByteData data = await rootBundle.load("Assets/Images/DevopsResume.pdf");
        List<int> bytes = data.buffer.asUint8List();
        File file = File(savePath);
        await file.writeAsBytes(bytes);

        // Download using flutter_downloader
        final taskId = await FlutterDownloader.enqueue(
          url: savePath,
          savedDir: downloadsDir.path,
          fileName: "Krish.pdf",
          showNotification: true, // Show download progress in notifications
          openFileFromNotification: true, // Open after download
        );
        // Show Error Message
        Fluttertoast.showToast(
          msg: "Download Complete: ${file.path}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );

        print("Download started: $taskId");
      } else {
        Directory? downloadsDir = await getExternalStorageDirectory();
        String savePath = "${downloadsDir!.path}/KrishResume.pdf";

        // Load PDF from assets
        ByteData data =
            await rootBundle.load("Assets/Images/FlutterResume.pdf");
        List<int> bytes = data.buffer.asUint8List();
        File file = File(savePath);
        await file.writeAsBytes(bytes);

        // Download using flutter_downloader
        final taskId = await FlutterDownloader.enqueue(
          url: savePath,
          savedDir: downloadsDir.path,
          fileName: "Krish.pdf",
          showNotification: true, // Show download progress in notifications
          openFileFromNotification: true, // Open after download
        );
        // Show Error Message
        Fluttertoast.showToast(
          msg: "Download Complete: ${file.path}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );

        print("Download started: $taskId");
      }
    } catch (e) {
      print("Error downloading file: $e");
    }
  }
}
