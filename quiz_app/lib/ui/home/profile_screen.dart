import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_app/theme/color.dart';
import 'dart:io';

import 'package:quiz_app/theme/theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  PickedFile _imageFile;
  final _picker = ImagePicker();
  var isPicked = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height*0.8,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              buildPicture(),
              SizedBox(height: 25),
              Text(
                'Robert Fodie',
                style: CizoThemes.textTheme700.headline2
                    .copyWith(color: CizoColors.darkColor),
              ),
              getEmail('robert12fodie@gmail.com'),
              editProfile(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPicture() {
    return Stack(
      children: [
        Container(
          width: 140,
          height: 140,
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.06,
            bottom: MediaQuery.of(context).size.height * 0.01,
          ),
          decoration: BoxDecoration(
            color: CizoColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: CizoColors.whiteColor,
              width: 2,
            ),
          ),
          child: _imageFile == null
              ? Image(
                  image: AssetImage('assets/icons/empty_image.jpg'),
                  fit: BoxFit.cover,
                )
              : Image(
                  image: FileImage(
                    File(_imageFile.path),
                  ),
                  fit: BoxFit.cover,
                ),
        ),
        Positioned(
          bottom: -25,
          left: 50,
          right: 50,
          child: Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.only(bottom: 25),
            decoration: BoxDecoration(
              color: CizoColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text("Choose a source to pick an image!"),
                    actions: [
                      // ignore: deprecated_member_use
                      FlatButton.icon(
                        onPressed: () {
                          takePhoto(ImageSource.gallery);
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.camera),
                        label: Text('From Gallery'),
                      ),
                      // ignore: deprecated_member_use
                      FlatButton.icon(
                        onPressed: () {
                          takePhoto(ImageSource.camera);
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.camera),
                        label: Text('From Camera'),
                      ),
                    ],
                  ),
                );
                isPicked = true;
                setState(() {});
              },
              icon: isPicked
                  ? Icon(
                      Icons.camera_alt_outlined,
                      color: CizoColors.primaryColor,
                    )
                  : Icon(
                      Icons.add,
                      color: CizoColors.primaryColor,
                    ),
            ),
          ),
        ),
      ],
    );
  }

  void takePhoto(ImageSource source) async {
    // ignore: deprecated_member_use
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Widget getEmail(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 35, vertical: 14),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: CizoColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(
        text,
        style: CizoThemes.textTheme600.headline4
            .copyWith(color: CizoColors.primaryColor),
      ),
    );
  }

  Widget editProfile() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CizoColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          iconContainer(data: Icons.person_outline),
          Text(
            'Edit Profile',
            style: CizoThemes.textTheme600.headline3,
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
              color: CizoColors.primaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget changePassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CizoColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          iconContainer(data: Icons.person_outline),
          Text(
            'Change Password',
            style: CizoThemes.textTheme600.headline3,
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
              color: CizoColors.primaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget logOut() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CizoColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          iconContainer(data: Icons.arrow_forward_ios_outlined),
          Text(
            'Logout',
            style: CizoThemes.textTheme600.headline3,
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward,
              color: CizoColors.primaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget iconContainer({IconData data}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: CizoColors.primaryColor.withOpacity(0.1),
      ),
      child: Icon(
        data,
        color: CizoColors.primaryColor,
      ),
    );
  }
}
