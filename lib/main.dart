import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'locale/app_localization.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppLocalizationDelegate _localeOverrideDelegate =
      AppLocalizationDelegate(Locale('en', 'US'));

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.greenAccent),
      localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      _localeOverrideDelegate
    ], supportedLocales: [
      const Locale('en', 'US'),
      const Locale('sw', 'SW')
    ], 
    home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internationalization'),
        centerTitle: true,
          ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ListTile(
              leading: RaisedButton(
                color: Colors.green[200],
                onPressed: () {
                  setState(() {
                    AppLocalization.load(Locale('en', 'US'));
                  });
                },
                child: Text('ENGLISH'),
              ),
              trailing: RaisedButton(
                color: Colors.green[200],
                onPressed: () {
                  setState(() {
                    AppLocalization.load(Locale('sw', 'SW'));
                  });
                },
                child: Text('SWAHILI'),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              AppLocalization.of(context).heyWorld,
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}