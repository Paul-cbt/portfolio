import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ZoomableImage extends StatefulWidget {
  final BorderRadius borderRadius;
  final String path;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final bool? zoomable;

  const ZoomableImage(
      {required this.borderRadius,
      required this.path,
      this.fit,
      this.zoomable,
      this.height,
      this.width});

  @override
  _ZoomableImageState createState() => _ZoomableImageState();
}

class _ZoomableImageState extends State<ZoomableImage> {
  late String oldPath;
  @override
  void initState() {
    oldPath = widget.path;
    super.initState();
  }

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
      onTap: widget.zoomable ?? true
          ? () {
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
                                  child: kIsWeb
                                      ? CachedNetworkImage(
                                          placeholder: (context, url) {
                                            return Shimmer.fromColors(
                                              child: Container(
                                                  height: 300, width: 600),
                                              baseColor: Colors.grey[300] ??
                                                  Colors.grey,
                                              highlightColor:
                                                  Colors.grey[100] ??
                                                      Colors.grey,
                                            );
                                          },
                                          imageUrl: "assets/${widget.path}",
                                        )
                                      : Image.asset("assets/${widget.path}"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }));
            }
          : () {},
      child: Hero(
        tag: widget.path,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: widget.borderRadius,
              child: kIsWeb
                  ? CachedNetworkImage(
                      placeholder: (context, url) {
                        return ClipRRect(
                          borderRadius: widget.borderRadius,
                          child: Shimmer.fromColors(
                            period: Duration(milliseconds: 700),
                            child: Container(
                              height: widget.height,
                              width: widget.width,
                              color: Colors.grey,
                            ),
                            baseColor: Colors.grey[300] ?? Colors.grey,
                            highlightColor: Colors.grey[100] ?? Colors.grey,
                          ),
                        );
                      },
                      imageUrl: "assets/${widget.path}",
                      height: widget.height,
                      width: widget.width,
                      fit: widget.fit ?? BoxFit.fitHeight,
                    )
                  : Image.asset(
                      "assets/${widget.path}",
                      height: widget.height,
                      width: widget.width,
                      fit: widget.fit ?? BoxFit.fitHeight,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
