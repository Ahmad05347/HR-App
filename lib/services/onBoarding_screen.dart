import 'package:flutter/material.dart';
import 'package:hr_project/services/main_pages.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(
                () {
                  onLastPage = index == 2;
                },
              );
            },
            children: [
              Container(
                color: Colors.grey[800],
              ),
              Container(
                color: Colors.grey[700],
              ),
              Container(
                color: Colors.blueGrey,
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SmoothPageIndicator(controller: _controller, count: 3),
                  onLastPage
                      ? InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ExtraPages(),
                              ),
                            );
                          },
                          child: const Text(
                            "Done",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInCubic);
                          },
                          child: const Text(
                            "Next",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
