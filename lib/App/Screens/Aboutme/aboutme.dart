import 'package:flutter/material.dart';
import 'package:myportfolio/Views/Themes/Colors/colors.dart';
import 'package:myportfolio/Views/Themes/Icons/icons.dart';
import 'package:myportfolio/Views/Themes/Measures/measures.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: Measures.getHeight(context) * 0.5,
      width: Measures.getWidth(context) * 0.65,
      // color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Measures.getHeight(context) * 0.09,
            width: Measures.getWidth(context) * 0.3,
//color: Colors.black,
            child: Row(
              children: [
                Text(
                  "0 1.",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 19,
                      foreground: Paint()
                        ..shader = AppColorPalette.textGradient),
                ),
                const SizedBox(width: 20.0),
                Text(
                  "About Me",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 22,
                      foreground: Paint()..shader = AppColorPalette.white),
                ),
                const SizedBox(width: 30.0),
                SizedBox(
                  width: Measures.getWidth(context) * 0.1,
                  child: const Divider(
                    height: 0.3,
                    color: Colors.white60,
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //height: Measures.getHeight(context) * 0.3,
                width: Measures.getWidth(context) * 0.3,
                //   color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 17,
                            color: Colors.white60,
                          ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 17,
                            color: Colors.white60,
                          ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Text(
                          "I have Build ",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 17,
                                    color: Colors.white60,
                                  ),
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          "Awesome Apps",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 19,
                                  foreground: Paint()
                                    ..shader = AppColorPalette.textGradient),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    Text(
                      "Here are few Technologioes I've been Working with Recently",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 17,
                            color: Colors.white60,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                height: Measures.getHeight(context) * 0.4,
                width: Measures.getWidth(context) * 0.3,
                //  color: Colors.pink,
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                        height: Measures.getHeight(context) * 0.35,
                        width: Measures.getWidth(context) * 0.2,
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 3,
                          color: const Color.fromARGB(255, 135, 24, 245),
                        ))),
                    Positioned(
                      top: 0,
                      left: 10,
                      bottom: 40,
                      child: Container(
                        height: Measures.getHeight(context) * 0.15,
                        width: Measures.getWidth(context) * 0.2,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Image.asset(CustomIcons.profile),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
