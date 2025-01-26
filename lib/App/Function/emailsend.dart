// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:http/http.dart' as http;

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
}
