import 'package:flutter/material.dart';
import 'package:portfolio/pages/contact.dart';
import 'package:portfolio/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/pages/navbar.dart';
import 'package:portfolio/pages/presentation.dart';
import 'package:portfolio/pages/projects.dart';
import 'package:portfolio/service/theme.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AppStateNotifier>(
      create: (context) => AppStateNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(
      builder: (context, appState, child) {
        return MaterialApp(
          title: 'Paul Caubet',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
        );
      },
    );
  }
}

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    int page = 0;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              transform: GradientRotation(page < 2 ? -15 : 0),
              colors: [
                Theme.of(context).textTheme.headline2?.color ?? Colors.white,
                Theme.of(context).textTheme.headline3?.color ?? Colors.white,
              ],
              begin: (page < 2 ? Alignment.topLeft : Alignment.bottomLeft),
              end: page < 2 ? Alignment.bottomRight : Alignment.topRight),
        ),
        child: Stack(
          children: [
            PageView(
              onPageChanged: (value) {
                setState(() {
                  page = value;
                });
              },
              scrollDirection: Axis.vertical,
              controller: controller,
              children: [
                Home(
                  controller: controller,
                ),
                Presentation(
                  controller: controller,
                ),
                Projects(),
                Contact()
              ],
            ),
            NavBar(
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}
