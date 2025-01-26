// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/App/Function/emailsend.dart';
import 'package:myportfolio/App/Utils/Variables.dart';
import 'package:myportfolio/Views/Animations/animation.dart';
import 'package:myportfolio/Views/Themes/Colors/colors.dart';
import '../../../Views/Themes/Measures/measures.dart';

class Contactus extends StatefulWidget {
  const Contactus({super.key});

  @override
  State<Contactus> createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController firstname = TextEditingController();
    TextEditingController lastname = TextEditingController();
    TextEditingController description = TextEditingController();

    return SizedBox(
      key: Variables.headerKey,

      width: Measures.getWidth(context) * 0.85,
      //  color: Colors.amber,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            // height: Measures.getHeight(context) * 0.45,
            width: Measures.getWidth(context) * 0.3,
            //color: Colors.black,
            child: CustomAnimation(
              index: 12,
              duration: const Duration(milliseconds: 800),
              verticalOffset: 50.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Us",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.8),
                        ),
                  ),
                  const SizedBox(height: 8), // Spacing between text
                  Text(
                    "Let's Connect and Collaborate",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 16), // Additional spacing
                  Text(
                    "Have an exciting project in mind or want to work together? Feel free to drop a message. I'd love to hear from you!",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 18,
                          color: Colors.white.withOpacity(0.7),
                        ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "tarunkrish2001@gmail.com",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.8),
                        ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "9597176872",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.8),
                        ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            //  height: Measures.getHeight(context) * 0.55,
            width: Measures.getWidth(context) * 0.3,
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 135, 24, 245).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15), // Shadow color
                  blurRadius: 10, // Softens the shadow
                  spreadRadius: 2, // Extends the shadow
                  offset: const Offset(4, 4), // X and Y axis offset
                ),
              ],
            ),
            child: Column(children: [
              Container(
                // height: Measures.getHeight(context) * 0.15,
                width: Measures.getWidth(context),
                padding: const EdgeInsets.all(20.0),
                // color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Get in Touch",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "You can reach us anytime",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Measures.getHeight(context) * 0.1,
                width: Measures.getWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: firstname,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 18,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: AppColorPalette.secendarycolor,
                          ),
                          labelText:
                              "First Name", // Use labelText for a description that moves
                          labelStyle: GoogleFonts.lato(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: AppColorPalette.secendarycolor,
                          ),
                          hintText: "Enter your first name",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color:
                                AppColorPalette.secendarycolor.withOpacity(0.6),
                          ),
                          border: OutlineInputBorder(
                            gapPadding: 10.0,
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColorPalette.secendarycolor,
                              width: 1.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColorPalette.secendarycolor
                                  .withOpacity(0.5),
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 135, 24, 245),
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: lastname,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 18,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person,
                              color: AppColorPalette.secendarycolor),
                          labelText:
                              "Last Name", // Use labelText for a description that moves
                          labelStyle: GoogleFonts.lato(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: AppColorPalette.secendarycolor,
                          ),
                          hintText: "Last name",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color:
                                AppColorPalette.secendarycolor.withOpacity(0.6),
                          ),
                          border: OutlineInputBorder(
                            gapPadding: 10.0,
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColorPalette.secendarycolor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColorPalette.secendarycolor
                                  .withOpacity(0.5),
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 135, 24, 245),
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: email,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.8),
                      ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: AppColorPalette.secendarycolor,
                    ),
                    labelText:
                        "Email", // Use labelText for a description that moves
                    labelStyle: GoogleFonts.lato(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: AppColorPalette.secendarycolor,
                    ),
                    hintText: "Email",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColorPalette.secendarycolor.withOpacity(0.6),
                    ),
                    border: OutlineInputBorder(
                      gapPadding: 10.0,
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: AppColorPalette.secendarycolor,
                        width: 1.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: AppColorPalette.secendarycolor.withOpacity(0.5),
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 135, 24, 245),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 160, // Set the initial height based on your requirement
                margin: const EdgeInsets.all(20.0),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white24,
                  border: Border.all(
                    color: AppColorPalette.secendarycolor,
                    width: 1.0,
                  ),
                ),
                child: SingleChildScrollView(
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    controller: description,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 18,
                          color: Colors.white.withOpacity(0.8),
                        ),
                    maxLines: null, // Allows the text field to grow vertically
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.description,
                        color: AppColorPalette.secendarycolor,
                      ),
                      border: InputBorder.none, // No default border
                      hintText: "Enter a detailed description...",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColorPalette.secendarycolor.withOpacity(0.7),
                      ),
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final combinename = firstname.text + lastname.text;
                  final status = await emailservice.sendemail(
                      name: combinename,
                      email: email.text,
                      message: description.text);
                  setState(() {
                    Variables.isemailprocess = status;
                  });

// If status is true, schedule hiding the success message after 2 seconds
                  if (status) {
                    Future.delayed(const Duration(seconds: 2), () {
                      setState(() {
                        Variables.isemailprocess = false;
                      });
                    });
                  }
                },
                child: Container(
                    transform: Matrix4.translationValues(
                        0, Variables.iscontactHovered ? -5 : 0, 0),
                    height: Measures.getHeight(context) * 0.05,
                    width: Measures.getWidth(context) * 0.25,
                    margin: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColorPalette.secendarycolor,
                      ),

                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 135, 24, 245),
                          Color.fromARGB(255, 154, 11, 173)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                      ),
                      // No gradient when not hovered
                      // White background when not hovered
                    ),
                    child: Text(
                      "Submit",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 16, color: Colors.white),
                    )),
              ),
              Variables.isemailprocess
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.check, color: Colors.green),
                        const SizedBox(width: 20.0),
                        Text(
                          "Submitted Sucessfully",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 16, color: Colors.white),
                        )
                      ],
                    )
                  : Container()
            ]),
          )
        ],
      ),
    );
  }
}

class MobileViewContactus extends StatefulWidget {
  const MobileViewContactus({super.key});

  @override
  State<MobileViewContactus> createState() => _MobileViewContactusState();
}

class _MobileViewContactusState extends State<MobileViewContactus> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController firstname = TextEditingController();
    TextEditingController lastname = TextEditingController();
    TextEditingController description = TextEditingController();

    return SizedBox(
      key: Variables.headerKey,

      width: Measures.getWidth(context),
      //  color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            // height: Measures.getHeight(context) * 0.45,
            width: Measures.getWidth(context),
            //color: Colors.black,
            child: CustomAnimation(
              index: 20,
              duration: const Duration(milliseconds: 800),
              verticalOffset: 50.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Us",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.8),
                        ),
                  ),
                  const SizedBox(height: 8), // Spacing between text
                  Text(
                    "Let's Connect and Collaborate",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 16), // Additional spacing
                  Text(
                    "Have an exciting project in mind or want to work together? Feel free to drop a message. I'd love to hear from you!",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 18,
                          color: Colors.white.withOpacity(0.7),
                        ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "tarunkrish2001@gmail.com",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.8),
                        ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "9597176872",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.8),
                        ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            //  height: Measures.getHeight(context) * 0.55,

            //  margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15), // Shadow color
                  blurRadius: 10, // Softens the shadow
                  spreadRadius: 2, // Extends the shadow
                  offset: const Offset(4, 4), // X and Y axis offset
                ),
              ],
            ),
            child: Column(children: [
              Container(
                // height: Measures.getHeight(context) * 0.15,
                width: Measures.getWidth(context),
                padding: const EdgeInsets.all(20.0),
                // color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Get in Touch",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "You can reach us anytime",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Measures.getHeight(context) * 0.1,
                width: Measures.getWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: firstname,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 18,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: AppColorPalette.secendarycolor,
                          ),
                          labelText:
                              "First Name", // Use labelText for a description that moves
                          labelStyle: GoogleFonts.lato(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: AppColorPalette.secendarycolor,
                          ),
                          hintText: "Enter your first name",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color:
                                AppColorPalette.secendarycolor.withOpacity(0.6),
                          ),
                          border: OutlineInputBorder(
                            gapPadding: 10.0,
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColorPalette.secendarycolor,
                              width: 1.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColorPalette.secendarycolor
                                  .withOpacity(0.5),
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 135, 24, 245),
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: lastname,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 18,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person,
                              color: AppColorPalette.secendarycolor),
                          labelText:
                              "Last Name", // Use labelText for a description that moves
                          labelStyle: GoogleFonts.lato(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: AppColorPalette.secendarycolor,
                          ),
                          hintText: "Last name",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color:
                                AppColorPalette.secendarycolor.withOpacity(0.6),
                          ),
                          border: OutlineInputBorder(
                            gapPadding: 10.0,
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColorPalette.secendarycolor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColorPalette.secendarycolor
                                  .withOpacity(0.5),
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 135, 24, 245),
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: email,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.8),
                      ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: AppColorPalette.secendarycolor,
                    ),
                    labelText:
                        "Email", // Use labelText for a description that moves
                    labelStyle: GoogleFonts.lato(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: AppColorPalette.secendarycolor,
                    ),
                    hintText: "Email",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColorPalette.secendarycolor.withOpacity(0.6),
                    ),
                    border: OutlineInputBorder(
                      gapPadding: 10.0,
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: AppColorPalette.secendarycolor,
                        width: 1.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: AppColorPalette.secendarycolor.withOpacity(0.5),
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 135, 24, 245),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 160, // Set the initial height based on your requirement
                margin: const EdgeInsets.all(10.0),
                // padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white24,
                  border: Border.all(
                    color: AppColorPalette.secendarycolor,
                    width: 1.0,
                  ),
                ),
                child: SingleChildScrollView(
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    controller: description,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 18,
                          color: Colors.white.withOpacity(0.8),
                        ),
                    maxLines: null, // Allows the text field to grow vertically
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.description,
                        color: AppColorPalette.secendarycolor,
                      ),
                      border: InputBorder.none, // No default border
                      hintText: "Enter a detailed description...",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColorPalette.secendarycolor.withOpacity(0.7),
                      ),
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final combinename = firstname.text + lastname.text;
                  if (combinename != "" &&
                      email.text != "" &&
                      description.text != "") {
                    final status = await emailservice.sendemail(
                        name: combinename,
                        email: email.text,
                        message: description.text);

                    setState(() {
                      Variables.isemailprocess = status;
                    });

// If status is true, schedule hiding the success message after 2 seconds
                    if (status) {
                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          Variables.isemailprocess = false;
                        });
                      });
                    }
                  }
                },
                child: Container(
                    transform: Matrix4.translationValues(
                        0, Variables.iscontactHovered ? -5 : 0, 0),
                    height: Measures.getHeight(context) * 0.05,
                    width: Measures.getWidth(context) * 0.25,
                    //   margin: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColorPalette.secendarycolor,
                      ),

                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 135, 24, 245),
                          Color.fromARGB(255, 154, 11, 173)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                      ),
                      // No gradient when not hovered
                      // White background when not hovered
                    ),
                    child: Text(
                      "Submit",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 16, color: Colors.white),
                    )),
              ),
              Variables.isemailprocess
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.check, color: Colors.green),
                        const SizedBox(width: 20.0),
                        Text(
                          "Submitted Sucessfully",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 16, color: Colors.white),
                        )
                      ],
                    )
                  : Container()
            ]),
          )
        ],
      ),
    );
  }
}
