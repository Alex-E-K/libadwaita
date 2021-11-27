import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdwClamp.scrollable(
      center: true,
      controller: _controller,
      child: Column(
        children: [
          const AdwPreferencesGroup(
            title: "Pages",
            description:
                "Preferences are organized in pages, this example has the following pages:",
            children: [
              AdwActionRow(
                title: "Layout",
              ),
              AdwActionRow(
                title: "Search",
              ),
            ],
          ),
          const SizedBox(height: 12),
          const AdwPreferencesGroup(
            title: "Groups",
            description:
                "Preferences are grouped together, a group can have a title and a description. Descriptions will be wrapped if they are too long. This page has the following groups:",
            children: [
              AdwActionRow(title: "An untitled group"),
              AdwActionRow(title: "Pages"),
              AdwActionRow(title: "Groups"),
              AdwActionRow(title: "Preferences"),
            ],
          ),
          const SizedBox(height: 12),
          AdwPreferencesGroup(
            title: "Subpages",
            description: "Preferences windows can have subpages.",
            children: [
              AdwActionRow(
                title: "Go to a subpage",
                end: const Icon(Icons.chevron_right),
                onActivated: () => debugPrint("Hi"),
              ),
              const AdwActionRow(
                title: "Go to another subpage",
                end: Icon(Icons.chevron_right),
              ),
            ],
          ),
          const SizedBox(height: 12),
          AdwTextField(
              initialValue: "some text",
              keyboardType: TextInputType.number,
              labelText: "Text field label",
              icon: Icons.insert_photo,
              onChanged: (String s) {}),
        ],
      ),
    );
  }
}