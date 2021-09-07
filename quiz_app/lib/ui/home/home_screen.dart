import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/theme/color.dart';
import 'package:quiz_app/theme/theme.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  var isVisible = true;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          height: MediaQuery.of(context).size.height*0.8,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 90,
                    vertical: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CizoColors.whiteColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 14,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/handshake.png'),
                        Text(
                          'Hello',
                          style: CizoThemes.textTheme600.headline5.copyWith(
                            color: CizoColors.darkColor.withOpacity(0.6),
                          ),
                        ),
                        Text(
                          'Robert',
                          style: CizoThemes.textTheme700.headline5
                              .copyWith(color: CizoColors.darkColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(25),
                  margin: EdgeInsets.all(25),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CizoColors.primaryColor,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      image: AssetImage('assets/icons/background.png'),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Find Quiz Code',
                        style: CizoThemes.textTheme700.headline4,
                      ),
                      Text(
                        'Enter quiz code that given by teacher, and you can start gathering points!',
                        style: CizoThemes.textTheme700.headline4,
                      ),
                      TextField(
                        controller: searchController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Search quiz code',
                          hintStyle: CizoThemes.textTheme400.headline2.copyWith(
                            color: CizoColors.darkColor.withOpacity(0.6),
                          ),
                          prefixIcon: isVisible
                              ? null
                              : Icon(
                                  Icons.search_outlined,
                                  color: CizoColors.greyColor,
                                ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 20,
                          ),
                          suffix: InkWell(
                            onTap: () {
                              setState(() {
                                searchController.clear();
                              });
                            },
                          ),
                          filled: true,
                          enabled: true,
                          fillColor: CizoColors.whiteColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(style: BorderStyle.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 25,
                    top: 10,
                    left: 25,
                    bottom: 35,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Public Quiz',
                        style: CizoThemes.textTheme700.headline4
                            .copyWith(color: CizoColors.darkColor),
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
                ),
              ],
            ),
          ),
        ),
      );
  }
}
