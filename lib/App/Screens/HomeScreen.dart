// ignore_for_file: file_names

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:myportfolio/Themes/Measures/measures.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> indextext = ["Home", "Projects", "Services", "About"];
  int selectedindex = 0;
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Measures.getHeight(context),
        width: Measures.getWidth(context),
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Measures.getHeight(context) * 0.1,
                width: Measures.getWidth(context) * 0.95,
                // color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: Measures.getHeight(context) * 0.08,
                      width: Measures.getWidth(context) * 0.08,
                      //   color: Colors.pink,
                    ),
                    Container(
                        height: Measures.getHeight(context) * 0.08,
                        width: Measures.getWidth(context) * 0.4,
                        // color: Colors.pink,
                        padding: const EdgeInsets.only(left: 50.0),
                        child: GridView.builder(
                            padding: const EdgeInsets.all(15.0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedindex = index;
                                      });
                                    },
                                    child: Text(indextext[index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                fontSize: 17,
                                                color: selectedindex == index
                                                    ? Colors.white
                                                    : Colors.white24)),
                                  ),
                                  const SizedBox(height: 5.0),
                                  selectedindex == index
                                      ? AnimationConfiguration.staggeredList(
                                          position: index,
                                          duration:
                                              const Duration(milliseconds: 200),
                                          child: SlideAnimation(
                                              horizontalOffset: 50.0,
                                              child: FadeInAnimation(
                                                  child: Container(
                                                height: Measures.getHeight(
                                                        context) *
                                                    0.005,
                                                width:
                                                    Measures.getWidth(context) *
                                                        0.02,
                                                color: Colors.white24,
                                              ))))
                                      : Container()
                                ],
                              );
                            })),
                    Container(
                      height: Measures.getHeight(context) * 0.05,
                      width: Measures.getWidth(context) * 0.08,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Text("Contact Us",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 15, color: Colors.black)),
                      //      color: Colors.pink,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              Container(
                height: Measures.getHeight(context),
                width: Measures.getWidth(context) * 0.95,
                // color: Colors.amber,
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: Measures.getHeight(context) * 0.7,
                        width: Measures.getWidth(context) * 0.4,
                        //    color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: Measures.getHeight(context) * 0.25,
                              width: Measures.getWidth(context) * 0.3,
                              //   color: Colors.pink,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  AnimationConfiguration.staggeredList(
                                      position: 1,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: SlideAnimation(
                                          horizontalOffset: 50.0,
                                          child: FadeInAnimation(
                                              child: Text(
                                            "Hey I'm",
                                            textAlign: TextAlign.start,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: 17,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          )))),
                                  AnimationConfiguration.staggeredList(
                                      position: 2,
                                      duration:
                                          const Duration(milliseconds: 700),
                                      child: SlideAnimation(
                                          horizontalOffset: 50.0,
                                          child: FadeInAnimation(
                                              child: Text(
                                            "Tarun Krishna",
                                            textAlign: TextAlign.start,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                    fontSize: 55,
                                                    color: Colors.white),
                                          )))),
                                  AnimationConfiguration.staggeredList(
                                      position: 3,
                                      duration:
                                          const Duration(milliseconds: 900),
                                      child: SlideAnimation(
                                          horizontalOffset: 50.0,
                                          child: FadeInAnimation(
                                              child: Text(
                                            "Flutter Developer",
                                            textAlign: TextAlign.start,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                    fontSize: 30,
                                                    color: Colors.white),
                                          )))),
                                  AnimationConfiguration.staggeredList(
                                      position: 4,
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      child: SlideAnimation(
                                          horizontalOffset: 40.0,
                                          child: FadeInAnimation(
                                              child: Text(
                                            "From India ",
                                            textAlign: TextAlign.start,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: 17,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ))))
                                ],
                              ),
                            ),
                            SizedBox(
                                width: Measures.getWidth(context) * 0.35,
                                // color: Colors.amber,

                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AnimationConfiguration.staggeredList(
                                          position: 1,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          child: SlideAnimation(
                                              horizontalOffset: 50.0,
                                              child: FadeInAnimation(
                                                child: DottedBorder(
                                                  color: Colors.white54,
                                                  dashPattern: const [2, 4],
                                                  radius: const Radius.circular(
                                                      20.0),
                                                  borderType: BorderType.RRect,
                                                  strokeWidth: 3,
                                                  child: const FlutterLogo(
                                                      size: 148),
                                                ),
                                              ))),
                                      AnimationConfiguration.staggeredList(
                                          position: 2,
                                          duration:
                                              const Duration(milliseconds: 700),
                                          child: SlideAnimation(
                                              horizontalOffset: 50.0,
                                              child: FadeInAnimation(
                                                child: DottedBorder(
                                                  dashPattern: const [2, 4],
                                                  color: Colors.white54,
                                                  strokeWidth: 3,
                                                  radius: const Radius.circular(
                                                      20.0),
                                                  borderType: BorderType.RRect,
                                                  child: const FlutterLogo(
                                                      size: 148),
                                                ),
                                              ))),
                                      AnimationConfiguration.staggeredList(
                                          position: 4,
                                          duration:
                                              const Duration(milliseconds: 900),
                                          child: SlideAnimation(
                                              horizontalOffset: 50.0,
                                              child: FadeInAnimation(
                                                  child: DottedBorder(
                                                dashPattern: const [2, 4],
                                                radius:
                                                    const Radius.circular(20.0),
                                                borderType: BorderType.RRect,
                                                color: Colors.white54,
                                                strokeWidth: 3,
                                                child: const FlutterLogo(
                                                    size: 148),
                                              ))))
                                    ]))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: Measures.getHeight(context) * 0.8,
                      width: Measures.getWidth(context) * 0.4,
                      color: Colors.amber,
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: Measures.getHeight(context) * 0.3,
                              width: Measures.getWidth(context) * 0.3,
                              color: Colors.pink,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: Measures.getHeight(context) * 0.55,
                              width: Measures.getWidth(context) * 0.25,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
