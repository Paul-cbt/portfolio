import 'package:flutter/material.dart';

class ZoomableImage extends StatefulWidget {
  final BorderRadius borderRadius;
  final String path;
  final double? height;
  final double? width;
  const ZoomableImage(
      {required this.borderRadius,
      required this.path,
      this.height,
      this.width});

  @override
  _ZoomableImageState createState() => _ZoomableImageState();
}

class _ZoomableImageState extends State<ZoomableImage> {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 100,
      borderRadius: widget.borderRadius,
      onTap: () {
        Navigator.of(context).push(new PageRouteBuilder(
            opaque: false,
            barrierDismissible: true,
            pageBuilder: (BuildContext context, _, __) {
              return Container(
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(15),
                      child: InteractiveViewer(
                        constrained: true,
                        child: Hero(
                          tag: widget.path,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              widget.path,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
      },
      child: Hero(
        tag: widget.path,
        child: ClipRRect(
          borderRadius: widget.borderRadius,
          child: Image.asset(
            widget.path,
            height: widget.height,
            width: widget.width,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
