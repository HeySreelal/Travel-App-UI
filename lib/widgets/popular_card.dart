import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/config/config.dart';
import 'package:travelapp/models/destination.dart';
import 'package:travelapp/screens/details.dart';
import 'package:travelapp/utils/slide.dart';

class PopularCard extends StatelessWidget {
  final Destination destination;
  const PopularCard(
    this.destination, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          slidingRoute(
            DetailsPage(destination),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: TravelTheme.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(4, 0),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        width: 230,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              padding: const EdgeInsets.all(0),
              child: Hero(
                tag: destination.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    destination.path,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              destination.name,
              style: const TextStyle(
                fontSize: 20,
                color: TravelTheme.darkGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  CupertinoIcons.location,
                  color: TravelTheme.grey,
                ),
                Text(
                  destination.location,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: TravelTheme.grey,
                      ),
                ),
                const Spacer(),
                const Icon(
                  Icons.star,
                  color: TravelTheme.grey,
                ),
                Text(
                  "${destination.rating} Rating",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: TravelTheme.grey,
                      ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
