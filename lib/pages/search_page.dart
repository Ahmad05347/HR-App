import 'package:flutter/material.dart';
import 'package:hr_project/components/templates_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<TemplatesModel> templatesModel = [
    TemplatesModel(
      92,
      "Professional Templates",
      "lib/images/dark.jpg",
    ),
    TemplatesModel(5, "Dark Themed Templates", "lib/images/dark2.jpg"),
    TemplatesModel(4, "Hello Templates", "lib/images/facebook.png"),
    TemplatesModel(3, "There Templates", "lib/images/google.png"),
    TemplatesModel(1, "Bye Templates", "lib/images/image1.jpg"),
    TemplatesModel(91, "Black Templates", "lib/images/image2.jpg"),
    TemplatesModel(2, "White Templates", "lib/images/Resume1 (1).png"),
    TemplatesModel(9, "Pizza Templates", "lib/images/Resume1 (2).png"),
    TemplatesModel(9.2, "Failed Templates", "lib/images/Resume1 (3).png"),
  ];

  List<TemplatesModel> display_list = List.from(templatesModel);

  void updateList(String value) {
    setState(
      () {
        display_list = templatesModel
            .where((element) => element.templates_title!
                .toLowerCase()
                .contains(value.toLowerCase()))
            .toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Search Templates",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade300,
                hintText: "eg: Dark Themed...",
                hintStyle: TextStyle(color: Colors.grey[500]),
                prefixIcon: const Icon(Icons.search_rounded),
                prefixIconColor: Colors.grey[700],
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: display_list.isEmpty
                  ? const Center(
                      child: Text("No Result Found"),
                    )
                  : ListView.builder(
                      itemCount: display_list.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: const EdgeInsets.all(5),
                        title: Text(
                          display_list[index].templates_title!,
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          "${display_list[index].ratings}",
                          style:
                              const TextStyle(color: Colors.deepPurpleAccent),
                        ),
                        leading:
                            Image.asset(display_list[index].templates_url!),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
