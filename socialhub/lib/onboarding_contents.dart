class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Welcome To Social Hub",
    image: 'assets/images/three.png',
    desc: "Your Social Media Partner",
  ),
  OnboardingContents(
    title: "Download Anything In Minutes",
    image: "assets/images/four.png",
    desc: "Supports All The Major Social Media Platforms",
  ),
  OnboardingContents(
    title: "Social Media Made Easy",
    image: 'assets/images/one.png',
    desc: "Download Your Favourite Content For Free.",
  ),
];
