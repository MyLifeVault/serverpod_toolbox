import 'package:flutter/material.dart';
import 'package:serverpod_toolbox/project_tab.dart';
import 'package:serverpod_toolbox/themes/app_theme.dart';
import 'package:serverpod_toolbox/user_admin_tab.dart';

///
/// A toolbox for common commands used when developing a serverpod project
///
class ServerPodToolbox extends StatefulWidget {
    const ServerPodToolbox({super.key});

    @override
    ServerPodToolboxState createState() => ServerPodToolboxState();
}

class ServerPodToolboxState extends State<ServerPodToolbox> {
    bool isDarkMode = false;
    late AppTheme currentTheme;

    @override
    void didChangeDependencies() {
        super.didChangeDependencies();
        currentTheme = AppTheme(context, ThemeMode.system);
    }

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: "Serverpod Toolbox",
            theme: currentTheme.themeData,
            home: DefaultTabController(
                length: 2, // Define the number of tabs
                child: Scaffold(
                    appBar: AppBar(
                        actions: [
                            _buildThemeSwitch(),
                        ],
                        title: const Row(
                            children: [Text('Serverpod Toolbox - A set of tools for managing a serverpod project')],
                        ),
                        bottom: const TabBar(
                            tabs: [
                                Tab(text: 'Project'),
                                Tab(text: 'User Admin- TBA'),
                            ],
                        ),
                    ),
                    body: const TabBarView(
                        children: [
                            ProjectTab(),
                            UserAdminTab(),
                        ],
                    ),
                ),
            ),
        );
    }

    Row _buildThemeSwitch() {
        return Row(
            mainAxisSize: MainAxisSize.min, // Adjust the width of the Row
            children: [
                const Text(
                    'Theme',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.0,
                    ),
                ),
                Switch(
                    value: isDarkMode,
                    onChanged: toggleTheme,
                    activeColor: Colors.white,
                    activeTrackColor: Colors.blueAccent,
                    inactiveTrackColor: Colors.grey, // Optional: color for the inactive track
                    inactiveThumbColor: Colors.white, // Optional: color for the inactive thumb
                ),
            ],
        );
    }

    void toggleTheme(bool value) {
        setState(() {
                isDarkMode = value;
                currentTheme = isDarkMode ? AppTheme(context, ThemeMode.dark) : AppTheme(context, ThemeMode.light);
            });
    }
}

void main() {
    runApp(const MaterialApp(
            home: ServerPodToolbox(),
        ));
}
