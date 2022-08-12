import 'package:flutter/material.dart';
import 'package:themingflutterapp/theme/theme_constants.dart';
import 'package:themingflutterapp/theme/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void dispose() {
  super.dispose();
     _themeManager.removeListener(themeManager);
  }

  @override
  void initState() {
  super.initState();
_themeManager.addListener(themeManager);
  }

  themeManager() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                _themeManager.themeMode == ThemeMode.light
                    ? 'Light theme'
                    : 'Dark theme',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: SwitchListTile(
            value: _themeManager.themeMode == ThemeMode.dark,
            onChanged: (value) {
              _themeManager.toggleTheme(value);
            })
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
