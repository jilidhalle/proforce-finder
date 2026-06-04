import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../content/site_text.dart';
import '../services/contact_form_service.dart';
import '../theme/app_colors.dart';
import '../widgets/primary_button.dart';
import '../widgets/section_header.dart';
import '../widgets/site_shell.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({required this.text, super.key});

  final SiteText text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.navy,
      child: SiteShell(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 78),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxWidth < 820;

            final intro = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(
                  eyebrow: text.contactEyebrow,
                  title: text.contactTitle,
                  description: text.contactDescription,
                  onDark: true,
                ),
              ],
            );

            final form = _ContactForm(text: text);

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

class _ContactForm extends StatefulWidget {
  const _ContactForm({required this.text});

  final SiteText text;

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
        SnackBar(content: Text(widget.text.successMessage)),
      );
      return;
    }

    messenger.showSnackBar(SnackBar(content: Text(widget.text.failureMessage)));
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
              decoration: InputDecoration(labelText: widget.text.nameLabel),
              validator: _validateRequired,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _businessController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: widget.text.businessLabel),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: widget.text.emailLabel),
              validator: _validateEmail,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _messageController,
              maxLines: 5,
              decoration: InputDecoration(labelText: widget.text.messageLabel),
              validator: _validateMessage,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: PrimaryButton(
                label: _isSending
                    ? widget.text.sending
                    : widget.text.sendInquiry,
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
      return widget.text.requiredField;
    }
    return null;
  }

  String? _validateEmail(String? value) {
    final trimmed = value?.trim() ?? '';
    final emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

    if (trimmed.isEmpty) {
      return widget.text.emailRequired;
    }
    if (!emailPattern.hasMatch(trimmed)) {
      return widget.text.emailInvalid;
    }
    return null;
  }

  String? _validateMessage(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return widget.text.messageRequired;
    }
    if (trimmed.length < 10) {
      return widget.text.messageTooShort;
    }
    return null;
  }
}
