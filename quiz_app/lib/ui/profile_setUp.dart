import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/theme/color.dart';
import 'package:quiz_app/theme/theme.dart';
import 'package:quiz_app/ui/signIn_signUp.dart';

class ProfileSetUp extends StatefulWidget {
  static const routeName = '/profileSetUp';

  const ProfileSetUp({Key key}) : super(key: key);

  @override
  _ProfileSetUpState createState() => _ProfileSetUpState();
}

class _ProfileSetUpState extends State<ProfileSetUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.asset(
              'assets/icons/back_image.png',
              height: MediaQuery.of(context).size.height * 0.48,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08,
                  left: MediaQuery.of(context).size.width * 0.08,
                  right: MediaQuery.of(context).size.width * 0.08,
                ),
                height: MediaQuery.of(context).size.height * 0.82,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: CizoColors.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildTitle(),
                      buildPicture(),
                      buildAddPicture(),
                      buildRegion(),
                      buildConfirm(),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.02,
              left: MediaQuery.of(context).size.width * 0.04,
              child: Image.asset('assets/icons/rocket.png'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(SignIn_SignUp.routeName);
          },
        ),
        SizedBox(width: 10),
        Text(
          'Setting Up Your Profile',
          style: CizoThemes.textTheme700.headline3,
        ),
      ],
    );
  }

  Widget buildPicture() {
    return Container(
      width: 140,
      height: 140,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.06,
        bottom: MediaQuery.of(context).size.height * 0.01,
      ),
      decoration: BoxDecoration(
        color: CizoColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Icon(
        Icons.photo_camera_outlined,
        color: CizoColors.primaryColor,
        size: 34,
      ),
    );
  }

  Widget buildAddPicture() {
    return TextButton(
      onPressed: () async {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Choose a source to pick an image!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text("From Gallery"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text("From Camera"),
              ),
            ],
          ),
        );
      },
      child: Text(
        'Add Profile Picture',
        style: CizoThemes.textTheme600.headline3,
      ),
    );
  }

  Widget buildRegion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            'Region',
            style: CizoThemes.textTheme400.headline4.copyWith(
              color: CizoColors.darkColor.withOpacity(0.8),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: CizoColors.whiteColor,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFC5C5C5).withOpacity(0.2),
                offset: Offset(0, 5),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/icons/indonesia.svg'),
                  SizedBox(width: 20),
                  RichText(
                    text: TextSpan(
                      text: 'Indonesia  ',
                      style: CizoThemes.textTheme700.headline4.copyWith(
                        color: CizoColors.darkColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '+62',
                          style: CizoThemes.textTheme400.headline3
                              .copyWith(color: CizoColors.greyColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: CizoColors.primaryColor,
                  size: 33,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
      ],
    );
  }

  Widget buildConfirm() {
    return MaterialButton(
        onPressed: () {},
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
          'Confirm',
          style: CizoThemes.textTheme700.headline4.copyWith(
            color: CizoColors.whiteColor,
          ),
        ),
        minWidth: MediaQuery.of(context).size.width * 0.9,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22), side: BorderSide.none),
        color: CizoColors.primaryColor);
  }
}
