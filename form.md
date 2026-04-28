# Contact Form Implementation for Flutter Web (Web3Forms)

## Goal

Implement a simple contact form in Flutter Web that sends inquiries to the client’s email without Firebase Functions or backend code.

---

## Solution

Use **Web3Forms** by sending an HTTP POST request from Flutter.

Flow:

```txt
Flutter Contact Form
→ HTTP POST request
→ Web3Forms API
→ Email arrives in client inbox
Required Setup
Create a Web3Forms account.
Add the destination email (for development: your email, for production: client email).
Copy the Web3Forms access key.
Inject the key into the app using environment configuration.
Dependency

Add the HTTP package:

dependencies:
  http: ^1.2.2

Then run:

flutter pub get
Form Fields
Name — required
Business / Organization — optional
Email Address — required
Message — required
Access Key Handling (IMPORTANT)

Do not hardcode the key directly in UI code.

Use Dart environment variables via --dart-define.

Create config file
lib/config/app_config.dart
class AppConfig {
  static const String web3FormsAccessKey = String.fromEnvironment(
    'WEB3FORMS_KEY',
    defaultValue: 'DEV_KEY_HERE',
  );
}
Use in service
accessKey: AppConfig.web3FormsAccessKey,
Run locally (development key)
flutter run -d chrome \
  --dart-define=WEB3FORMS_KEY=your_dev_key
Build for production (client key)
flutter build web \
  --dart-define=WEB3FORMS_KEY=client_real_key
Suggested Dart Service
lib/services/contact_form_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ContactFormService {
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
UI Behavior

The form should:

Validate required fields before sending
Validate email format
Disable submit button while sending
Show loading state
Show success message
Show error message
Clear form after success
Example Submit Logic
Future<void> submitForm() async {
  if (!_formKey.currentState!.validate()) return;

  setState(() => isSending = true);

  final success = await ContactFormService.sendContactForm(
    accessKey: AppConfig.web3FormsAccessKey,
    name: nameController.text,
    business: businessController.text,
    email: emailController.text,
    message: messageController.text,
  );

  setState(() => isSending = false);

  if (success) {
    nameController.clear();
    businessController.clear();
    emailController.clear();
    messageController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Thank you. Your inquiry has been sent successfully.'),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Something went wrong. Please try again.'),
      ),
    );
  }
}
Validation Rules
Name: required
Email: required + valid format
Message: required (recommended min length: 10)
Business: optional