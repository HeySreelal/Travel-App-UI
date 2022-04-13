import 'package:flutter/material.dart';
import 'package:travelapp/config/config.dart';
import 'package:travelapp/models/destination.dart';

class DetailsPage extends StatefulWidget {
  final Destination destination;
  const DetailsPage(this.destination, {Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
          const FavShareButton(
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned(child: Container()),
          Positioned(
            child: Container(
              height: MediaQuery.of(context).size.height * .60,
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
          Positioned(
            top: MediaQuery.of(context).size.height * .60,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Overview",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: TravelTheme.primaryColor,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(4),
                                color: TravelTheme.black,
                                height: 2,
                                width: 50,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Column(
                            children: const [
                              Text(
                                "Reviews",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: TravelTheme.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DetailBox(
                            path: "assets/icons/destination.png",
                            title: "Duration",
                            value: "${widget.destination.duration} hours",
                          ),
                          const Spacer(),
                          DetailBox(
                              path: "assets/icons/star.png",
                              title: "Rating",
                              value: "${widget.destination.rating} out of 5",
                              iconColor: TravelTheme.ratingYellow),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DetailBox(
                        path: "assets/icons/time.png",
                        title: "Timing",
                        value: widget.destination.timing,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        style: TextStyle(
                          fontSize: 14,
                          color: TravelTheme.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.only(
          bottom: 18,
          top: 10,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(0),
              TravelTheme.white,
            ],
          ),
        ),
        child: Center(
          child: SizedBox(
            height: 50,
            width: 150,
            child: TextButton(
              onPressed: () {},
              child: const Text("Book Now"),
              style: ButtonStyle(
                elevation: MaterialStateProperty.resolveWith(
                  (states) => 0,
                ),
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => TravelTheme.primaryColor,
                ),
                foregroundColor: MaterialStateProperty.resolveWith(
                  (states) => TravelTheme.white,
                ),
                overlayColor: MaterialStateProperty.resolveWith(
                  (states) => TravelTheme.white.withOpacity(0.2),
                ),
                shape: MaterialStateProperty.resolveWith(
                  (states) => RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailBox extends StatelessWidget {
  final String path;
  final String title;
  final String value;
  final Color iconColor;
  const DetailBox({
    Key? key,
    required this.path,
    required this.title,
    required this.value,
    this.iconColor = TravelTheme.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageIcon(
          AssetImage(path),
          color: iconColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: TravelTheme.darkGrey,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                color: TravelTheme.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FavShareButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onTap;
  const FavShareButton({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: icon,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) => TravelTheme.white,
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => Colors.white10,
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
