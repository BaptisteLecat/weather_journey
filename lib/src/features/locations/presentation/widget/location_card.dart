import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_assistant/src/features/locations/domain/location.dart';

class LocationCard extends StatelessWidget {
  final Location location;
  const LocationCard({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    String cityText = location.city!.split(", ").first;
    if (location.city!.split(", ").length >= 6) {
      cityText = location.city!.split(", ").reversed.toList()[5];
    } else if (cityText.length < 3) {
      cityText = location.city!.split(", ").take(2).join(" ");
    }

    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).primaryColor,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Row(
              children: [
                Expanded(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                    child: Image.network(
                      'https://cdn.discordapp.com/attachments/1119307426445938769/1126876067722960916/baptistelecat_Prompt_The_sky_above_Nantes_is_kissed_by_the_gold_142f8d73-12c7-44c9-a52d-8728a0ff7642.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cityText,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(location.city!.split(", ").last,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: Colors.white,
                                  )),
                        ],
                      ),
                      Text("15°",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                color: Colors.white,
                                fontSize: 42,
                              )),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
