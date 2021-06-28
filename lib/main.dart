import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/pages/contact.dart';
import 'package:portfolio/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/pages/navbar.dart';
import 'package:portfolio/pages/presentation.dart';
import 'package:portfolio/pages/projects.dart';
import 'package:portfolio/service/playMusic.dart';
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

class _WrapperState extends State<Wrapper> with SingleTickerProviderStateMixin {
  bool isScrolling = false;
  late AnimationController iconController;
  bool hasPlayedMusic = false;
  bool hasLoadedMusic = false;
  final assetsAudioPlayer = AssetsAudioPlayer.withId("music");

  PageController controller = PageController();
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void startMusic() async {
    if (!hasLoadedMusic) {
      await loadMusic();
    }
    assetsAudioPlayer.playOrPause();
  }

  Future loadMusic() async {
    await assetsAudioPlayer.open(Audio("cropNight.mp3"),
        volume: 0.2,
        autoStart: false,
        respectSilentMode: true,
        loopMode: LoopMode.single,
        notificationSettings: NotificationSettings(),
        playInBackground: PlayInBackground.disabledRestoreOnForeground,
        showNotification: false);
    hasLoadedMusic = true;
  }

  @override
  void initState() {
    loadMusic();

    iconController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int page = 0;
    return Scaffold(
      body: Listener(
        onPointerSignal: (PointerSignalEvent event) {
          if (event is PointerScrollEvent) {
            if (event.scrollDelta.dy > 0 && !isScrolling) {
              isScrolling = true;
            } else if (event.scrollDelta.dy < 0 && !isScrolling) {
              isScrolling = true;
            }
          }
        },
        child: Container(
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
              Scrollbar(
                isAlwaysShown: MediaQuery.of(context).size.width > 500,
                controller: controller,
                child: PageView(
                  physics: PageScrollPhysics(),
                  allowImplicitScrolling: true,
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
              ),
              NavBar(
                controller: controller,
              ),
              if (!hasPlayedMusic)
                Container(
                  alignment: Alignment.bottomRight,
                  child: PlayMusic(
                      body: Container(),
                      color: Theme.of(context).primaryColorLight,
                      child: Material(
                          color: Colors.transparent,
                          child: Text('Start concert',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorLight))),
                      onSwipe: () {}),
                ),
              Container(
                margin: EdgeInsets.only(right: 10, bottom: 10),
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    startMusic();
                    setState(() {
                      hasPlayedMusic = true;
                    });
                    iconController.status.index == 0
                        ? iconController.forward()
                        : iconController.reverse();
                  },
                  child: AnimatedIcon(
                      size: 30,
                      icon: AnimatedIcons.play_pause,
                      progress: iconController),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
