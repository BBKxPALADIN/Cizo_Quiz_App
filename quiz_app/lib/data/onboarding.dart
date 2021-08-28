import 'package:flutter/cupertino.dart';

class Onboarding {
  String title;
  String desc;
  Image image;
  String btnText;

  Onboarding({
    this.title,
    this.desc,
    this.image,
    this.btnText,
  });

  void setTitle(String title) {
    this.title = title;
  }

  void setDesc(String desc) {
    this.desc = desc;
  }

  void setImage(Image image) {
    this.image = image;
  }

  void setBtnTexxt(String btnText){
    this.btnText=btnText;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

  Image getImage(){
    return image;
  }

  String getBtnText(){
    return btnText;
  }
}

List<Onboarding> getOnboarding() {
  // ignore: deprecated_member_use
  List<Onboarding> sliders = new List<Onboarding>();
  Onboarding onboarding = new Onboarding();

  onboarding.setTitle('Welcome to Cizo!');
  onboarding.setDesc(
      'Thank you for downloading our app! Enjoy all of Cizo features directly in your hands!');
  onboarding.setImage(Image.asset('assets/icons/handshake.png'));
  onboarding.setBtnTexxt('Next');
  sliders.add(onboarding);

  onboarding=new Onboarding();

  onboarding.setTitle('Trusted by Teachers');
  onboarding.setDesc(
      'Cizo is trusted by the teachers worldwide to maintain the student learning progress.');
  onboarding.setImage(Image.asset('assets/icons/union.png'));
  onboarding.setBtnTexxt('Next');
  sliders.add(onboarding);


  onboarding=new Onboarding();

  onboarding.setTitle('Get Ready, be a Superstar!');
  onboarding.setDesc(
      'Gather all the poins as much as you can, be a superstar in your class with Cizo!');
  onboarding.setImage(Image.asset('assets/icons/star.png'));
  onboarding.setBtnTexxt('Start the Journey!');
  sliders.add(onboarding);


  onboarding=new Onboarding();

  return sliders;
}
