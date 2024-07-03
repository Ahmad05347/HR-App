import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hr_project/components/product.dart';
import 'package:hr_project/services/main_pages.dart';
import 'package:open_app_file/open_app_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class PaidTemplates extends StatefulWidget {
  const PaidTemplates({super.key});

  @override
  State<PaidTemplates> createState() => _PaidTemplatesState();
}

class _PaidTemplatesState extends State<PaidTemplates> {
  List<Product> templatesList = [
    Product("Free Templates", "lib/images/Resume1 (1).png", "22"),
    Product(
      "Free Templates",
      "lib/images/Resume1 (2).png",
      "22",
    ),
    Product(
      "Free Templates",
      "lib/images/Resume1 (3).png",
      "22",
    ),
    Product(
      "Free Templates",
      "lib/images/Resume1 (4).png",
      "22",
    ),
    Product(
      "Free Templates",
      "lib/images/Resume1 (1).png",
      "22",
    ),
    Product(
      "Free Templates",
      "lib/images/Resume1 (2).png",
      "22",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   iconTheme: const IconThemeData(color: Colors.black),
      //   elevation: 0,
      //   leading: BackButton(
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => const ExtraPages(),
      //         ),
      //       );
      //     },
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(Icons.notification_add_rounded),
      //     ),
      //   ],
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            expandedHeight: 50,
            backgroundColor: Colors.transparent,
            leading: BackButton(
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExtraPages(),
                  ),
                );
              },
            ),
            title: const Center(
              child: Text(
                "Paid Templates",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notification_add),
              ),
            ],
            titleSpacing: 50,
            floating: true,
            //  shadowColor: Color.fromARGB(255, 158, 57, 91),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 400,
                  child: ScrollSnapList(
                    itemBuilder: _buildItemBuilder,
                    itemCount: templatesList.length,
                    itemSize: 200,
                    onItemFocus: (index) {},
                    dynamicItemSize: true,
                    background: Colors.transparent,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: Colors.black),
                      ),
                      color: Colors.grey[200],
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Add to Favourite")),
                            Icon(Icons.favorite_outline_rounded),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: Colors.black),
                      ),
                      color: Colors.grey[200],
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Add to Cart"),
                            ),
                            Icon(Icons.shopping_cart_rounded),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: Colors.black),
                      ),
                      color: Colors.grey[200],
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Share")),
                            Icon(Icons.shape_line_rounded),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemBuilder(BuildContext contect, int index) {
    Product product = templatesList[index];
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Container(
          width: 200,
          height: 340,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                product.imagePath,
              ),
              fit: BoxFit.fitHeight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: Offset.fromDirection(10),
              ),
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "20",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.download_for_offline_rounded,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future openFile({required String url, String? fileName}) async {
    final file = await downloadFile(url, fileName!);

    if (file == null) return;

    // ignore: avoid_print
    print("Path: ${file.path}");

    OpenAppFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File("${appStorage.path}/$name");

    final response = await Dio().get(
      url,
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
      ),
    );
    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();

    return file;
  }
}
