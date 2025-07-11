// edit_profile_page.dart
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController =
      TextEditingController(text: 'John Doe'); // قيم افتراضية
  final TextEditingController _emailController =
      TextEditingController(text: 'johndoe@email.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('edit_profile'.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // اسم المستخدم
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'username'.tr(),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please_enter_username'.tr();
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // البريد الإلكتروني
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'email'.tr(),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !value.contains('@')) {
                    return 'please_enter_valid_email'.tr();
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // زر الحفظ
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('profile_updated'.tr())),
                    );
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.save),
                label: Text('save'.tr()),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
