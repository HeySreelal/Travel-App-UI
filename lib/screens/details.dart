import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travelapp/config/config.dart';
import 'package:travelapp/models/destination.dart';
import 'package:travelapp/widgets/book_now.dart';
import 'package:travelapp/widgets/icon_button.dart';
import 'package:travelapp/widgets/overview_and_details.dart';

class DetailsPage extends StatefulWidget {
  final Destination destination;
  const DetailsPage(this.destination, {Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  ScrollController controller = ScrollController();

  late double coverHeight;

  var animationDuration = const Duration(milliseconds: 100);

  @override
  void initState() {
    coverHeight = 500;
    controller.addListener(() {
      // if scrolling down, change the cover height according to the scroll position
      if (controller.position.userScrollDirection == ScrollDirection.reverse) {
        if (coverHeight < 470) {
          return;
        }
        setState(() {
          coverHeight = coverHeight - controller.offset * 0.01;
        });
      } else if (controller.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (coverHeight > 500 || controller.offset < 0) {
          return;
        }

        setState(() {
          coverHeight = coverHeight + controller.offset * 0.2;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: FavShareButton(
          icon: const Icon(Icons.chevron_left),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          FavShareButton(
            icon: widget.destination.isFavourite
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_outline),
            onTap: () {
              widget.destination.updateFav();
              setState(() {});
            },
          ),
          const SizedBox(
            width: 10,
          ),
          FavShareButton(
            icon: const Icon(Icons.share),
            onTap: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Positioned(
              child: Container(
                height: MediaQuery.of(context).size.height,
              ),
            ),
            AnimatedPositioned(
              duration: animationDuration,
              height: coverHeight,
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: coverHeight,
                decoration: const BoxDecoration(),
                child: Hero(
                  tag: widget.destination.id,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.6),
                          ],
                        ).createShader(
                          Rect.fromLTRB(
                            0,
                            0,
                            rect.width,
                            rect.height,
                          ),
                        );
                      },
                      blendMode: BlendMode.darken,
                      child: Image.asset(
                        widget.destination.path,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: animationDuration,
              top: coverHeight - 120,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.destination.name,
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: TravelTheme.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    RichText(
                        text: TextSpan(
                      children: [
                        TextSpan(
                          text: "\$ ${widget.destination.price} /",
                        ),
                        TextSpan(
                          text: " per person",
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    color: TravelTheme.white,
                                  ),
                        ),
                      ],
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: TravelTheme.white,
                          ),
                    )),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              duration: animationDuration,
              top: coverHeight,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: OverviewAndDetails(
                      destination: widget.destination,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BookNow(),
    );
  }
}
