import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingViewController extends StatefulWidget {
  @override
  _SettingViewControllerState createState() => _SettingViewControllerState();
}

class _SettingViewControllerState extends State<SettingViewController> {
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

  void _changeLanguage(String value) {
    setState(() {
      _selectedLanguage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('JD'),
                ),
                title: Text('John Doe'),
                subtitle: Text('johndoe@gmail.com'),
              ),
            ),
          ),
          Expanded(
            child: ListView(
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
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Help'),
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