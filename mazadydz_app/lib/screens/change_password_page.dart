import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _changePassword() {
    if (_formKey.currentState!.validate()) {
      // هنا يمكنك إرسال كلمة المرور إلى الخادم أو تنفيذ أي منطق آخر
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('password_changed'.tr())),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('change_password'.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _oldPasswordController,
                decoration: InputDecoration(labelText: 'old_password'.tr()),
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'required_field'.tr() : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _newPasswordController,
                decoration: InputDecoration(labelText: 'new_password'.tr()),
                obscureText: true,
                validator: (value) =>
                    value!.length < 6 ? 'password_too_short'.tr() : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _confirmPasswordController,
                decoration:
                    InputDecoration(labelText: 'confirm_password'.tr()),
                obscureText: true,
                validator: (value) {
                  if (value != _newPasswordController.text) {
                    return 'passwords_do_not_match'.tr();
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _changePassword,
                child: Text('save'.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
