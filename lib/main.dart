// @dart=2.9
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/pages/contact.dart';
import 'package:portfolio/pages/home.dart';
import 'package:portfolio/pages/navbar.dart';
import 'package:portfolio/pages/presentation.dart';
import 'package:portfolio/pages/projects/projects.dart';
import 'package:portfolio/service/playMusic.dart';
import 'package:portfolio/service/theme.dart';
import 'package:universal_html/html.dart' as uni;

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
          title: 'Paul Caubet || Portfolio',
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
  const Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> with SingleTickerProviderStateMixin {
  bool isScrolling = false;
  AnimationController iconController;
  bool hasPlayedMusic = false;
  bool hasLoadedMusic = false;
  final assetsAudioPlayer = AssetsAudioPlayer.withId("music");
  ScrollPhysics physics = PageScrollPhysics();
  bool pageSnapping = false;
  int page = 0;
  int lastPage = 6;
  bool isScrollingWithFinger = true;

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
    var loader = uni.document.getElementsByClassName('info');
    if (loader.isNotEmpty) {
      loader.first.remove();
      //remove the loading in the html file
    }
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
    return DefaultTextStyle(
      style: TextStyle(fontFamily: 'QuickSand'),
      child: Scaffold(
        endDrawer: EndNavBar(controller: controller),
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: Listener(
            onPointerMove: (event) {
              //if user is using a touch screen for example
              if (!pageSnapping) {
                setState(() {
                  isScrollingWithFinger = true;
                  pageSnapping = true;
                });
              }
            },
            onPointerSignal: (PointerSignalEvent event) {
              //if user is using mouse

              setState(() {
                isScrollingWithFinger = false;
              });
              if (event is PointerScrollEvent) {
                if (event.scrollDelta.dy > 0) {
                  try {
                    double offSet = controller.offset -
                        page * MediaQuery.of(context).size.height;

                    if (offSet < 0) {
                      setState(() {
                        pageSnapping = true;
                      });
                    } else {
                      setState(() {
                        pageSnapping = false;
                      });
                    }
                  } catch (e) {}
                } else if (event.scrollDelta.dy < 0) {
                  try {
                    double offSet = controller.offset -
                        page * MediaQuery.of(context).size.height;

                    if (offSet > 0) {
                      setState(() {
                        pageSnapping = true;
                      });
                    } else {
                      setState(() {
                        pageSnapping = false;
                      });
                    }
                  } catch (e) {}
                }
              }
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    transform: GradientRotation(page < 2 ? -15 : 0),
                    colors: [
                      Theme.of(context).textTheme.headline2?.color ??
                          Colors.white,
                      Theme.of(context).textTheme.headline3?.color ??
                          Colors.white,
                    ],
                    begin:
                        (page < 2 ? Alignment.topLeft : Alignment.bottomLeft),
                    end: page < 2 ? Alignment.bottomRight : Alignment.topRight),
              ),
              child: Stack(
                children: [
                  Scrollbar(
                    isAlwaysShown: MediaQuery.of(context).size.width > 500,
                    controller: controller,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                        },
                      ),
                      child: PageView(
                        physics: ScrollPhysics(),
                        pageSnapping: pageSnapping,
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
                          ...Project.values
                              .map(
                                (e) => Projects(project: e),
                              )
                              .toList(),
                          Contact()
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      NavBar(
                        controller: controller,
                      ),
                    ],
                  ),
                  if (!hasPlayedMusic &&
                      (MediaQuery.of(context).size.width > 700 ||
                          page == 0 ||
                          page == 3) &&
                      MediaQuery.of(context).size.width > 425)
                    Container(
                      alignment: Alignment.bottomRight,
                      child: PlayMusic(
                          body: Container(),
                          color: Theme.of(context).primaryColorLight,
                          child: Material(
                              color: Colors.transparent,
                              child: Text('Start concert',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width >
                                                  650
                                              ? 20
                                              : 13,
                                      color: Theme.of(context)
                                          .primaryColorLight))),
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
        ),
      ),
    );
  }
}

enum Project {
  leaScore,

  outLearn,
  kjMethod,
  teacherATN,
}
