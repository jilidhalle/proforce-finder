import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../services/contact_form_service.dart';
import '../theme/app_colors.dart';
import '../widgets/primary_button.dart';
import '../widgets/section_header.dart';
import '../widgets/site_shell.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.navy,
      child: SiteShell(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 78),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxWidth < 820;

            final intro = const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(
                  eyebrow: 'Contact',
                  title: "Let's Build Your Next Team",
                  description:
                      "Tell us what kind of team you need, and we'll help you find the right professionals.",
                  onDark: true,
                ),
                SizedBox(height: 24),
                _ContactNote(),
              ],
            );

            final form = const _ContactForm();

            if (isCompact) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [intro, const SizedBox(height: 30), form],
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: intro),
                const SizedBox(width: 54),
                Expanded(child: form),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ContactNote extends StatelessWidget {
  const _ContactNote();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.12)),
      ),
      child: const Row(
        children: [
          Icon(Icons.lock_outline_rounded, color: AppColors.orange),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Placeholder contact details can be added here in a later iteration.',
              style: TextStyle(color: AppColors.white, height: 1.45),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactForm extends StatefulWidget {
  const _ContactForm();

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _businessController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isSending = false;

  @override
  void dispose() {
    _nameController.dispose();
    _businessController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    final messenger = ScaffoldMessenger.of(context);
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid || _isSending) {
      return;
    }

    setState(() => _isSending = true);

    final success = await ContactFormService.sendContactForm(
      accessKey: AppConfig.web3FormsAccessKey,
      name: _nameController.text,
      business: _businessController.text,
      email: _emailController.text,
      message: _messageController.text,
    );

    if (!mounted) {
      return;
    }

    setState(() => _isSending = false);

    if (success) {
      _nameController.clear();
      _businessController.clear();
      _emailController.clear();
      _messageController.clear();

      messenger.showSnackBar(
        const SnackBar(
          content: Text('Thank you. Your inquiry has been sent successfully.'),
        ),
      );
      return;
    }

    messenger.showSnackBar(
      const SnackBar(content: Text('Something went wrong. Please try again.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: _validateRequired,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _businessController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Business / Organization',
              ),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Email Address'),
              validator: _validateEmail,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _messageController,
              maxLines: 5,
              decoration: const InputDecoration(labelText: 'Message'),
              validator: _validateMessage,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: PrimaryButton(
                label: _isSending ? 'Sending...' : 'Send Inquiry',
                onPressed: _isSending ? null : _submitForm,
                icon: _isSending
                    ? Icons.hourglass_top_rounded
                    : Icons.send_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _validateRequired(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required.';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    final trimmed = value?.trim() ?? '';
    final emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

    if (trimmed.isEmpty) {
      return 'Email address is required.';
    }
    if (!emailPattern.hasMatch(trimmed)) {
      return 'Enter a valid email address.';
    }
    return null;
  }

  String? _validateMessage(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return 'Message is required.';
    }
    if (trimmed.length < 10) {
      return 'Please add a little more detail.';
    }
    return null;
  }
}
