import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;
  String _selectedLanguage = 'English';

  @override
  void initState() {
    super.initState();
    // Load saved settings
    _loadSettings();
  }

  void _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
      _selectedLanguage = prefs.getString('selectedLanguage') ?? 'English';
    });
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
    await prefs.setString('selectedLanguage', _selectedLanguage);
  }

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Column(
        children: [
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: _isDarkMode,
              onChanged: _toggleDarkMode,
            ),
          ),
          ListTile(
            title: Text('Language'),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              items: [
                DropdownMenuItem(value: 'English', child: Text('English')),
                DropdownMenuItem(value: 'Chinese', child: Text('中文')),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue == null) return;
                  _selectedLanguage = newValue!;
                });
              }
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveSettings,
        child: Icon(Icons.save),
      ),
    );
  }
}