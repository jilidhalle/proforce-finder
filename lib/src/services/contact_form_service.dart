import 'dart:convert';

import 'package:http/http.dart' as http;

class ContactFormService {
  const ContactFormService._();

  static const String _endpoint = 'https://api.web3forms.com/submit';

  static Future<bool> sendContactForm({
    required String accessKey,
    required String name,
    required String email,
    required String message,
    String business = '',
  }) async {
    final response = await http.post(
      Uri.parse(_endpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'access_key': accessKey,
        'subject': 'New inquiry from ProForce Finder website',
        'name': name.trim(),
        'business': business.trim(),
        'email': email.trim(),
        'message': message.trim(),
        'botcheck': '',
      }),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      return false;
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return data['success'] == true;
  }
}
