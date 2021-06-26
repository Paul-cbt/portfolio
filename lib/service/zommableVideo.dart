import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';

class ZoomableVideo extends StatefulWidget {
  final BorderRadius borderRadius;
  final String path;
  final double? height;
  final double? width;
  const ZoomableVideo(
      {required this.borderRadius,
      required this.path,
      this.height,
      this.width});

  @override
  _ZoomableVideoState createState() => _ZoomableVideoState();
}

class _ZoomableVideoState extends State<ZoomableVideo> {
  late VideoPlayerController _controller;
  late VideoPlayerController _controller2;

  bool loading = true;
  @override
  void initState() {
    _controller = VideoPlayerController.asset(widget.path)
      ..initialize().then((_) {
        print("finished loading");
        _controller.setVolume(0);

        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          loading = false;
        });
      });
    _controller2 = VideoPlayerController.asset(widget.path)
      ..initialize().then((_) {
        print("finished loading");
        _controller2.setVolume(0);

        _controller2.play();
        _controller2.setLooping(true);
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          loading = false;
        });
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: 390,
          child: ClipRRect(
            borderRadius: widget.borderRadius,
            child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: !loading
                    ? Container(
                        height: 200,
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: VideoPlayer(_controller)),
                        ),
                      )
                    : Container(
                        height: 200,
                        width: 400,
                        child: Center(
                          child: SpinKitWave(
                            color: Theme.of(context).textTheme.headline4?.color,
                          ),
                        ),
                      )),
          ),
        ),
        InkWell(
          radius: 100,
          borderRadius: widget.borderRadius,
          onTap: () {
            print("tapped");
            _controller2.play();
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    backgroundColor: Colors.transparent,
                    contentPadding: EdgeInsets.all(0),
                    content: Container(
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: InteractiveViewer(
                              constrained: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: AnimatedSwitcher(
                                    duration: Duration(milliseconds: 300),
                                    child: !loading
                                        ? Container(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            child: AspectRatio(
                                              aspectRatio: _controller2
                                                  .value.aspectRatio,
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: VideoPlayer(
                                                      _controller2)),
                                            ),
                                          )
                                        : Container(
                                            height: 200,
                                            width: 400,
                                            child: Center(
                                              child: SpinKitWave(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .headline4
                                                    ?.color,
                                              ),
                                            ),
                                          )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            );
          },
          child: Container(
            height: 200,
            width: 390,
          ),
        ),
      ],
    );
  }
}
