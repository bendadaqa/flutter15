import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../main.dart';  // تأكد من استيراد MyApp للوصول إلى setThemeMode

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    isDarkMode = brightness == Brightness.dark;
  }

  void toggleDarkMode(bool value) {
    setState(() {
      isDarkMode = value;
    });

    final mode = value ? ThemeMode.dark : ThemeMode.light;
    MyApp.of(context).setThemeMode(mode);
  }

  void _changeLanguage(Locale locale) {
    context.setLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr()),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('dark_mode'.tr()),
            value: isDarkMode,
            onChanged: toggleDarkMode,
            secondary: const Icon(Icons.dark_mode),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text('change_language'.tr()),
            trailing: DropdownButton<Locale>(
              value: context.locale,
              onChanged: (locale) {
                if (locale != null) {
                  _changeLanguage(locale);
                }
              },
              items: const [
                DropdownMenuItem(
                  value: Locale('en'),
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: Locale('ar'),
                  child: Text('العربية'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
