import 'package:flutter/material.dart';
import 'package:hr_project/templates/templates_items.dart';
import 'package:transparent_image/transparent_image.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key, required this.templatesItems});

  final TemplatesItems templatesItems;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(templatesItems.imageURL),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      templatesItems.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    const Row(
                      children: [],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
