import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ViewGuidelineImages extends StatefulWidget {
  const ViewGuidelineImages({
    super.key,
    required this.imageUrls,
  });

  final List<String> imageUrls;

  @override
  State<ViewGuidelineImages> createState() => _ViewGuidelineImagesState();
}

class _ViewGuidelineImagesState extends State<ViewGuidelineImages> {
  var _page = 0.0;

  @override
  void initState() {
    super.initState();
    _page = widget.imageUrls.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    PageController pageController;
    pageController = PageController(initialPage: (widget.imageUrls.length - 1));
    pageController.addListener(
      () {
        setState(() {
          _page = pageController.page ?? 0.0;
        });
      },
    );

    return Center(
      child: Stack(
        children: [
          SizedBox(
            height: width,
            width: width * .95,
            child: LayoutBuilder(
              builder: (context, boxConstraints) {
                var cards = <Widget>[];

                for (int i = 0; i <= (widget.imageUrls.length - 1); i++) {
                  final currentPageValue = i - _page;
                  final pageLocation = currentPageValue > 0;

                  final start = 20.0 +
                      max(
                          (boxConstraints.maxWidth - width * .75) -
                              ((boxConstraints.maxWidth - width * .75) / 2) *
                                  -currentPageValue *
                                  (pageLocation ? 9 : 1),
                          0.0);

                  var customizableCard = Positioned.directional(
                    top: 20 + 30 * max(-currentPageValue, 0.0),
                    bottom: 20 + 30 * max(-currentPageValue, 0.0),
                    start: start,
                    textDirection: TextDirection.ltr,
                    child: Container(
                      height: width * .67,
                      width: width * .67,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 10.0,
                          )
                        ],
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            widget.imageUrls[i],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                  cards.add(customizableCard);
                }
                return Stack(children: cards);
              },
            ),
          ),
          Positioned.fill(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: widget.imageUrls.length,
              controller: pageController,
              itemBuilder: (context, index) {
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
