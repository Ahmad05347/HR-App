import 'package:flutter/material.dart';
import 'package:hr_project/templates/templates_data.dart';
import 'package:hr_project/templates/templates_items.dart';

class TemplatesV2 extends StatelessWidget {
  const TemplatesV2({super.key, required this.templates, required this.titles});

  final String titles;

  final List<TemplatesItems> templates;

  @override
  Widget build(BuildContext context) {
    Widget counter = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Nothing Here...",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Try Something Else",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black),
          ),
        ],
      ),
    );

    if (templates.isNotEmpty) {
      counter = ListView.builder(
        itemCount: templates.length,
        itemBuilder: ((context, index) => MenuItems(
              templatesItems: templates[index],
            )),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(titles),
      ),
      body: counter,
      //  backgroundColor: Colors.grey[700],
    );
  }
}
